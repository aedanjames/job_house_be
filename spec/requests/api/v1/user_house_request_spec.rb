require 'rails_helper'

RSpec.describe 'user_house requests' do
  it 'can save a user_house' do
    user = User.create!(email: "someemail")
    job = user.jobs.create!(salary: 1000000, location: "Houston, TX", company: "Texas Tech", contact: "Brad Chad", api_job_id: 1111, title: "Tech Bro")
    post "/api/v1/houses?email=#{user.email}&mls_id=1005192"
    expect(response).to be_successful
    expect(user.user_houses.count).to eq(1)
  end

  it 'can return a users houses', :vcr do
      user = User.create!(email: "someemail")
       saved_house = UserHouse.create!(user_id: user.id, house_id: 1005192)
       get '/api/v1/users/houses?email=someemail'
       houses = JSON.parse(response.body, symbolize_names: true)
       expect(houses).to be_a Hash
       expect(houses).to have_key(:data)
       expect(houses[:data]).to be_a Array
       houses[:data].each do |house|
         expect(house).to be_a Hash
         expect(house).to have_key(:id)
         expect(house).to have_key(:type)
         expect(house).to have_key(:attributes)
         expect(house[:attributes]).to have_key(:id)
         expect(house[:attributes]).to have_key(:list_price)
         expect(house[:attributes]).to have_key(:address)
         expect(house[:attributes]).to have_key(:contact)
         expect(house[:attributes]).to have_key(:api_house_id)
         expect(house[:attributes]).to have_key(:bedrooms)
         expect(house[:attributes]).to have_key(:half_baths)
         expect(house[:attributes]).to have_key(:full_baths)
         expect(house[:attributes]).to have_key(:view)
         expect(house[:attributes]).to have_key(:year_built)
         expect(house[:attributes]).to have_key(:photos)
       end
  end
end
