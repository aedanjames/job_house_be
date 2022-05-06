class UserHouse < ApplicationRecord
  belongs_to :user
  has_many :user_house_jobs
end
