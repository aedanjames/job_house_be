require 'rails_helper'

RSpec.describe 'user house job requests' do
  it 'returns an index of jobs', :vcr do
  user = User.create!(email: "someemail")
  saved_house = UserHouse.create!(user_id: user.id, house_id: 1005229)
  get "/api/v1/houses/jobs?email=#{user.email}&api_house_id=#{saved_house.house_id}"
  jobs = JSON.parse(response.body, symbolize_names: true)
  expect(jobs).to be_a Hash
  expect(jobs).to have_key(:data)
  expect(jobs[:data]).to be_a Array
  jobs[:data].each do |job|
    expect(job).to be_a Hash
    expect(job).to have_key(:id)
    expect(job).to have_key(:type)
    expect(job).to have_key(:attributes)
    expect(job[:attributes]).to have_key(:salary)
    expect(job[:attributes]).to have_key(:location)
    expect(job[:attributes]).to have_key(:id)
    expect(job[:attributes]).to have_key(:company)
    expect(job[:attributes]).to have_key(:contact)
    expect(job[:attributes]).to have_key(:title)
  end
  end
end
