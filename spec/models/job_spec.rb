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
end
