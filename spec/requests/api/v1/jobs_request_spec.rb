require 'rails_helper'

RSpec.describe 'jobs api' do
  it "sends a list of jobs for a given state and city" do
    VCR.use_cassette("sf yerbs") do
      get "/api/v1/jobs?state=colorado&city=denver"

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

  it 'can save a job to the database' do
    job = Job.create!(salary: 9999999, location: "Houston, Texas", company: "Texas Tech", contact: "Brad Chad", api_job_id: 1111, title: "Tech Bro")
    user = User.create!(email: "someemail")
    user_job = UserJob.create!(job_id: job.id, user_id: user.id)
    responseject = {
                :id=>1111,
                :salary=>"9999999",
                :title=>"Tech Bro",
                :city=>"Houston",
                :state=>"TX",
                :company=>"Texas Tech",
                :contact=>"Brad Chad",
                :api_job_id=>1111
              }
    post "/api/v1/jobs", :params => { :job => responseject.to_json, :email => "someemail" }

    jobject = Job.find_by(api_job_id: responseject[:id])
    expect(jobject.api_job_id).to eq(responseject[:id].to_i)

    job = JSON.parse(response.body, symbolize_names: true)

    expect(job[:data]).to have_key(:id)
    expect(job[:data][:id]).to be_a(String)

    expect(job[:data]).to have_key(:type)
    expect(job[:data][:type]).to be_a(String)

    expect(job[:data][:attributes]).to have_key(:location)
    expect(job[:data][:attributes][:location]).to be_a(String)

    expect(job[:data][:attributes]).to have_key(:company)
    expect(job[:data][:attributes][:company]).to be_a(String)

    expect(job[:data][:attributes]).to have_key(:contact)
    expect(job[:data][:attributes][:contact]).to be_a(String)

    expect(job[:data][:attributes]).to have_key(:salary)
    expect(job[:data][:attributes][:salary]).to be_an(Integer)
  end

  it 'can delete a job' do
    user = User.create!(email: "someemail")
    job_1 = Job.create!(salary: 1000000, location: "Houston, TX", company: "Texas Tech", contact: "Brad Chad", api_job_id: 1111, title: "Tech Bro")
    job_2 = Job.create!(salary: 5000000, location: "Houston, TX", company: "Texas Tech", contact: "Chad Brad", api_job_id: 1112, title: "Tech Person")

    UserJob.create!(user_id: user.id, job_id: job_1.id)
    UserJob.create!(user_id: user.id, job_id: job_2.id)
    expect(user.jobs.count).to eq(2)

    delete "/api/v1/user/#{user.id}/jobs/#{job_1.id}"

    expect(user.jobs.count).to eq(1)
  end
end
