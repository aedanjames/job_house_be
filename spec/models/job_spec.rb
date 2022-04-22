require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'relationships' do
    it { should have_many(:user_jobs) }
  end

  describe 'validations' do
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:salary), numericality: true }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:contact) }
    it { should validate_presence_of(:api_job_id) }
  end

  describe 'instance methods' do
    it ".location_hash" do
      job = Job.create!(salary: 9999999, location: "Houston, Texas", company: "Texas Tech", contact: "Brad Chad", api_job_id: 1111, title: "Tech Bro")

      expect(job.location_hash).to eq({:city=>"Houston", :state=>"Texas"})
    end

    it ".mortgage_calculator" do
      job = Job.create!(salary: 9999999, location: "Houston, Texas", company: "Texas Tech", contact: "Brad Chad", api_job_id: 1111, title: "Tech Bro")
      
      expect(job.mortgage_calculator).to eq(41697899)
    end
  end
end
