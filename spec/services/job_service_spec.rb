require 'rails_helper'

RSpec.describe 'job service' do
  it 'can connect to a job service api' do
    VCR.use_cassette(".get_job_info") do
      jobs = JobService.get_job_info("california", "san francisco")
    end
  end
end
