class User < ApplicationRecord
  has_many :user_jobs, dependent: :destroy
  has_many :jobs, through: :user_jobs
  validates_presence_of :email
  validates_uniqueness_of :email
end
