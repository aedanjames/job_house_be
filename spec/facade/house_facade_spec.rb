require 'rails_helper'

RSpec.describe 'The House Facade' do
  it ".find_houses" do
    VCR.use_cassette("House Facade") do
      location = {
        :city => "Houston",
        :state => "Texas"
      }
      houses = HouseFacade.find_houses(location, 999999999999999)
      expect(houses).to be_instance_of(Array)
      expect(houses.first).to be_instance_of(HousePoro)
      expect(houses.length).to eq(20)
    end
  end

  it ".find_saved_homes" do
    VCR.use_cassette("House Facade mls_id") do
      user = User.create!(email: "someemail")
      job = Job.create!(salary: 1000000, location: "Houston, TX", company: "Texas Tech", contact: "Brad Chad", api_job_id: 1111, title: "Tech Bro")
      user_job = UserJob.create!(user_id: user.id, job_id: job.id)
      user_job_house_1 = user_job.user_job_houses.create!(house_id: 1005192)
      user_job_house_2 = user_job.user_job_houses.create!(house_id: 1005221)

      houses = UserJob.find_by(user_id: user.id, job_id: job.id).user_job_houses

      saved_homes = HouseFacade.find_saved_homes(houses)
    end
  end
end
