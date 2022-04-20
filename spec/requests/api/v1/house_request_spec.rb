require 'rails_helper'

RSpec.describe 'house request' do
  it "sends a list of jobs for a given state and city" do
    VCR.use_cassette("houses") do
      job = Job.create!(salary_min: 1, salary_max: 1000000, location: "Houston, TX", company: "Texas Tech", contact: "Brad Chad", api_job_id: 1111, title: "Tech Bro")

      get "/api/v1/jobs/#{job.id}/houses"

      expect(response).to be_successful

      houses = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
