require 'rails_helper'

RSpec.describe 'The Job Facade' do
  it ".find_jobs" do
    VCR.use_cassette("many jobs") do

      jobs = JobFacade.find_jobs("california")

      expect(jobs).to be_instance_of(Array)
      jobs.each do |job_info|
        expect(job_info).to be_a Job
        expect(job_info.company).to be_a String
        expect(job_info.contact).to be_a String
        expect(job_info.id).to be_a String
        expect(job_info.location).to be_a Hash
        expect(job_info.location).to have_key('city')
        expect(job_info.location).to have_key('state')
        expect(job_info.salary_min).to be_an(Integer)
        expect(job_info.salary_max).to be_an(Integer)
      end
    end
  end
end
