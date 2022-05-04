require 'rails_helper'

RSpec.describe UserHouse, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :user_house_jobs }
  end
end
