require 'rails_helper'

RSpec.describe 'The Job Facade' do
  it ".find_jobs" do
    results = File.read('spec/fixtures/jobs_sf.json')

    stub_request(:get, "https://developer.adzuna.com/v1/api/jobs/us/search/1?app_id=&app_key=&location0=us&location1=california&location2=san%20francisco&salary_max=200000&salary_min=100000").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.2.0'
      }).
    to_return(status: 200, body: results, headers: {})

    jobs = JobFacade.find_jobs("california", "san francisco")

    expect(jobs).to be_instance_of(Array)
    expect(jobs.first).to be_instance_of(Job)
    expect(jobs.length).to eq(10)
  end
end
