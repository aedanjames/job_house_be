require 'rails_helper'

RSpec.describe 'user_job_house' do
  it 'can save a user_job_house relationship' do
    user = User.create!(email: "someemail")
    job = user.jobs.create!(salary: 1000000, location: "Houston, TX", company: "Texas Tech", contact: "Brad Chad", api_job_id: 1111, title: "Tech Bro")
    post "/api/v1/jobs/houses?email=someemail&job_id=#{job.id}&mls_id=1005192"
    user_job = UserJob.find_by(user_id: user.id, job_id: job.id)
    ujh = UserJobHouse.find_by(user_job_id: user_job.id)
    expect(ujh.house_id).to eq(1005192)
  end
end
