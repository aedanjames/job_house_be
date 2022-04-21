require 'rails_helper'

RSpec.describe UserJobHouse, type: :model do
  describe 'relationships' do
    it { should belong_to(:user_job) }
  end

  describe 'validations' do
    it { should validate_presence_of(:house_id) }
  end
end
