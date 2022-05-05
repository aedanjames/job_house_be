require 'rails_helper'

RSpec.describe 'user_house requests' do
  it 'can save a user_house' do
    user = User.create!(email: "someemail")
    job = user.jobs.create!(salary: 1000000, location: "Houston, TX", company: "Texas Tech", contact: "Brad Chad", api_job_id: 1111, title: "Tech Bro")
    post "/api/v1/houses?email=#{user.email}&mls_id=1005192"
    expect(response).to be_successful
    expect(user.user_houses.count).to eq(1)
  end
end
