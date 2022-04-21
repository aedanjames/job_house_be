require 'rails_helper'
RSpec.describe 'User API' do
  it "returns a selected user" do
    user = User.create!(email: "someemail")

      get "/api/v1/users?email=#{user.email}"

      expect(response).to be_successful

      user = JSON.parse(response.body, symbolize_names: true)
      expect(user).to have_key(:data)
      expect(user[:data]).to have_key(:id)
      expect(user[:data]).to have_key(:type)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:type]).to eq("user")
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes]).to have_key(:jobs)
    end

    it 'creates a new user even if one wasnt present' do
      get "/api/v1/users?email=someotheremail"

      expect(response).to be_successful

      user = JSON.parse(response.body, symbolize_names: true)
      expect(user).to have_key(:data)
      expect(user[:data]).to have_key(:id)
      expect(user[:data]).to have_key(:type)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:type]).to eq("user")
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes][:email]).to eq('someotheremail')
      expect(user[:data][:attributes]).to have_key(:jobs)
    end

  it 'knows a users user_jobs' do
    user_1 = User.create!(email: "someemail")
    job = Job.create!(company: "Company", location: "Location", contact: "Contact", salary: 100000, api_job_id: 388243892)
    UserJob.create!(user_id: user_1.id, job_id: job.id)
    # user_1.jobs.create!(company: "Company", location: "Location", contact: "Contact", salary: 100000, api_job_id: 388243892)
    get "/api/v1/users?email=someemail"
    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to have_key(:data)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:type]).to eq("user")
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:jobs)
    expect(user[:data][:attributes]).to have_key(:jobs)
    expect(user[:data][:attributes][:jobs].first).to have_key(:id)
    expect(user[:data][:attributes][:jobs].first).to have_key(:salary)
    expect(user[:data][:attributes][:jobs].first).to have_key(:company)
    expect(user[:data][:attributes][:jobs].first).to have_key(:location)
  end
end
