require 'rails_helper'

RSpec.describe UserHouseJob, type: :model do
  describe 'relationships' do
    it { should belong_to :user_house }
    it { should belong_to :job }
  end
end
