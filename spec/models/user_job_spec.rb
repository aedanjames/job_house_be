require 'rails_helper'

RSpec.describe UserJob, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :job }
    it { should have_many :user_job_houses }
  end

  it 'deletes user_job_houses on destroy' do

  end
end
