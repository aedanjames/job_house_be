require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:user_jobs) }
    it { should have_many(:jobs).through(:user_jobs) }
    it { should have_many(:user_houses) }
    it { should have_many(:user_house_jobs).through(:user_houses) }
  end
end
