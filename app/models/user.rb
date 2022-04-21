class User < ApplicationRecord
  has_many :user_jobs, dependent: :destroy
  has_many :jobs, through: :user_jobs
end
