require 'rails_helper'

RSpec.describe 'job service' do
  it 'can connect to a job service api' do
<<<<<<< HEAD
    VCR.use_cassette(".get_job_info") do
      jobs = JobService.get_job_info("california", "san francisco")
=======
    VCR.use_cassette("sf jobs") do
      jobs = JobService.get_job_info("california", "san francisco")

      expect(jobs).to be_a(Hash)
>>>>>>> 53b25ee300958a53601c1aa0f277a7d99ddc21c5
    end
  end
end
