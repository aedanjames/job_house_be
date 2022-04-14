require 'rails_helper'

RSpec.describe 'job service' do
  it 'can connect to a job service api' do
    VCR.use_cassette("sf jobs") do
      jobs = JobService.get_job_info("california", "san francisco")

      expect(jobs).to be_a(Hash)
    end
  end
end
