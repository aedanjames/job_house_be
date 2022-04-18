require 'rails_helper'
RSpec.describe 'User API' do
  it "returns a selected user" do
    user = User.create!(email: "someemail")

      get "/api/v1/users?email=#{user.email}"

      expect(response).to be_successful

      user = JSON.parse(response.body, symbolize_names: true)
      binding.pry
      expect(user).to have_key(:data)
      expect(user[:data]).to have_key(:id)
      expect(user[:data]).to have_key(:type)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:type]).to eq("user")
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data]).to have_key(:relationships)
      expect(user[:data][:relationships]).to have_key(:jobs)
      expect(user[:data][:relationships][:jobs]).to have_key(:data)
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
      expect(user[:data]).to have_key(:relationships)
      expect(user[:data][:relationships]).to have_key(:user_jobs)
      expect(user[:data][:relationships][:user_jobs]).to have_key(:data)
    end

    it 'knows a users user_jobs' do
      user_1 = User.create!(email: "someemail")
      user_1.user_jobs.create!(job_id: "12345")
        get "/api/v1/users?email=someemail"
        expect(response).to be_successful

        user = JSON.parse(response.body, symbolize_names: true)
        expect(user).to have_key(:data)
        expect(user[:data]).to have_key(:id)
        expect(user[:data]).to have_key(:type)
        expect(user[:data]).to have_key(:attributes)
        expect(user[:data][:type]).to eq("user")
        expect(user[:data][:attributes]).to have_key(:email)
        expect(user[:data]).to have_key(:relationships)
        expect(user[:data][:relationships]).to have_key(:user_jobs)
        expect(user[:data][:relationships][:user_jobs]).to have_key(:data)
        expect(user[:data][:relationships][:user_jobs][:data].first).to have_key(:id)
        expect(user[:data][:relationships][:user_jobs][:data].first).to have_key(:type)
        expect(user[:data][:relationships][:user_jobs][:data].first[:id]).to eq(user_1.user_jobs.first.id.to_s)
    end
end
