require 'rails_helper'

RSpec.describe 'job service' do
  it 'can connect to a job service api' do
    results = File.read('spec/fixtures/jobs_sf.json')
    state = "california"
    city = "san francisco"

    stub_request(:get, "https://developer.adzuna.com/v1/api/jobs/us/search/1?app_id=#{ENV['app_id']}&app_key=#{ENV['app_key']}&location0=us&location1=california&location2=san%20francisco&salary_max=200000&salary_min=100000").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.2.0'
           }).
         to_return(status: 200, body: results, headers: {})

    search = JobService.get_job_info(state, city)

    expect(search).to be_a(Hash)
  end
end
