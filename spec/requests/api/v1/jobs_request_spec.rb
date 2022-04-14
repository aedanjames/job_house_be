require 'rails_helper'

RSpec.describe 'jobs api' do
  xit "sends a list of jobs for a given state and city" do
    params = ActionController::Parameters.new(state: "California", city: "San Francisco")
    allow(controller).to receive(:params).and_return(params)

    results = File.read('spec/fixtures/jobs_sf.json')
    stub_request(:get, "https://developer.adzuna.com/v1/api/jobs/us/search/1?app_id=&app_key=&location0=us&location1=California&location2=San%20Francisco&salary_max=200000&salary_min=100000").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.2.0'
           }).
         to_return(status: 200, body: results, headers: {})

    get api_v1_jobs_path

    expect(response).to be_successful

    jobs = JSON.parse(response.body, symbolize_names: true)

    expect(jobs).to have_key(:data)
    expect(jobs[:data]).to be_an(Array)

    jobs[:data].each do |job|
      expect(job).to have_key(:id)
      expect(job[:id]).to be_a(String)

      expect(job).to have_key(:type)
      expect(job[:type]).to eq("job")

      expect(job[:attributes]).to have_key(:location)
      expect(job[:attributes][:location]).to be_an(Hash)

      expect(job[:attributes][:location]).to have_key(:city)
      expect(job[:attributes][:location][:city]).to be_a(String)

      expect(job[:attributes][:location]).to have_key(:state)
      expect(job[:attributes][:location][:state]).to be_a(String)

      expect(job[:attributes]).to have_key(:company)
      expect(job[:attributes][:company]).to be_a(String)

      expect(job[:attributes]).to have_key(:contact)
      expect(job[:attributes][:contact]).to be_a(String)

      expect(job[:attributes]).to have_key(:salary)
      expect(job[:attributes][:salary]).to be_an(Integer)
    end
  end
end
