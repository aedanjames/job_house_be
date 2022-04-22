class UserJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_many :user_job_houses, dependent: :destroy
end
