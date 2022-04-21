require 'rails_helper'

RSpec.describe 'house request' do
  it "sends a list of jobs for a given state and city" do
    VCR.use_cassette("houses") do
      job = Job.create!(salary: 9999999, location: "Houston, TX", company: "Texas Tech", contact: "Brad Chad", api_job_id: 1111, title: "Tech Bro")

      get "/api/v1/jobs/#{job.id}/houses"

      expect(response).to be_successful

      houses = JSON.parse(response.body, symbolize_names: true)

      expect(houses).to be_a(Hash)
      expect(houses).to have_key(:data)
      expect(houses[:data]).to be_an(Array)

      houses[:data].each do |house_info|
        expect(house_info).to have_key(:type)
        expect(house_info[:type]).to eq("job_house")

        expect(house_info).to have_key(:attributes)
        expect(house_info[:attributes]).to be_a(Hash)

        expect(house_info[:attributes]).to have_key(:id)
        expect(house_info[:attributes][:id]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:list_price)
        expect(house_info[:attributes][:list_price]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:address)
        expect(house_info[:attributes][:address]).to be_an(String)

        expect(house_info[:attributes]).to have_key(:contact)
        expect(house_info[:attributes][:contact]).to be_an(String)

        expect(house_info[:attributes]).to have_key(:bedrooms)
        expect(house_info[:attributes][:bedrooms]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:half_baths)
        expect(house_info[:attributes][:half_baths]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:full_baths)
        expect(house_info[:attributes][:full_baths]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:view)
        expect(house_info[:attributes][:view]).to be_an(String)

        expect(house_info[:attributes]).to have_key(:year_built)
        expect(house_info[:attributes][:year_built]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:photos)
        expect(house_info[:attributes][:photos]).to be_an(Array)
      end
    end
  end

  it "sends a list of saved homes" do
    VCR.use_cassette("saved houses") do
      user = User.create!(email: "someemail")
      job = Job.create!(salary: 1000000, location: "Houston, TX", company: "Texas Tech", contact: "Brad Chad", api_job_id: 1111, title: "Tech Bro")
      user_job = UserJob.create!(user_id: user.id, job_id: job.id)
      user_job_house_1 = user_job.user_job_houses.create!(house_id: 1005192)
      user_job_house_2 = user_job.user_job_houses.create!(house_id: 1005221)

      # houses = UserJob.find_by(user_id: user.id, job_id: job.id).user_job_houses

      get "/api/v1/jobs/houses?email=someemail&job_id=#{job.id}"

      expect(response).to be_successful

      houses = JSON.parse(response.body, symbolize_names: true)

      expect(houses).to be_a(Hash)
      expect(houses).to have_key(:data)
      expect(houses[:data]).to be_an(Array)

      houses[:data].each do |house_info|
        expect(house_info).to have_key(:type)
        expect(house_info[:type]).to eq("job_house")

        expect(house_info).to have_key(:attributes)
        expect(house_info[:attributes]).to be_a(Hash)

        expect(house_info[:attributes]).to have_key(:id)
        expect(house_info[:attributes][:id]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:list_price)
        expect(house_info[:attributes][:list_price]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:address)
        expect(house_info[:attributes][:address]).to be_an(String)

        expect(house_info[:attributes]).to have_key(:contact)
        expect(house_info[:attributes][:contact]).to be_an(String)

        expect(house_info[:attributes]).to have_key(:bedrooms)
        expect(house_info[:attributes][:bedrooms]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:half_baths)
        expect(house_info[:attributes][:half_baths]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:full_baths)
        expect(house_info[:attributes][:full_baths]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:view)
        expect(house_info[:attributes][:view]).to be_an(String)

        expect(house_info[:attributes]).to have_key(:year_built)
        expect(house_info[:attributes][:year_built]).to be_an(Integer)

        expect(house_info[:attributes]).to have_key(:photos)
        expect(house_info[:attributes][:photos]).to be_an(Array)
      end
    end
  end

  it 'can delete a job house' do
    user = User.create!(email: "someemail")
    job = Job.create!(salary: 1000000, location: "Houston, TX", company: "Texas Tech", contact: "Brad Chad", api_job_id: 1111, title: "Tech Bro")
    user_job = UserJob.create!(user_id: user.id, job_id: job.id)
    user_job_house_1 = user_job.user_job_houses.create!(house_id: 1005192)
    user_job_house_2 = user_job.user_job_houses.create!(house_id: 1005221)

    expect(UserJobHouse.count).to eq(2)
    expect(UserJobHouse.first.house_id).to eq(1005192)

    delete "/api/v1/jobs/houses?house_id=1005192&email=someemail&job_id=#{job.id}"

    expect(UserJobHouse.count).to eq(1)
    expect(UserJobHouse.first.house_id).to eq(1005221)
  end
end
