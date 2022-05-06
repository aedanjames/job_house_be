class User < ApplicationRecord
  has_many :user_jobs, dependent: :destroy
  has_many :jobs, through: :user_jobs
  has_many :user_houses
  has_many :user_house_jobs, through: :user_houses
end
