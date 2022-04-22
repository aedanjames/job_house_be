class UserJobHouse < ApplicationRecord
  belongs_to :user_job
  validates_presence_of :house_id
end
