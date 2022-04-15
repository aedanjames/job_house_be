require 'rails_helper'
RSpec.describe 'User API' do
  it "returns a selected user" do
    user = User.create!(email: "someemail")
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
    end
end
