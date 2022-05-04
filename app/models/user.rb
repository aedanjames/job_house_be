class User < ApplicationRecord
  has_many :user_jobs, dependent: :destroy
  has_many :jobs, through: :user_jobs
<<<<<<< HEAD
  validates_presence_of :email
  validates_uniqueness_of :email
=======
  has_many :user_houses
  has_many :user_house_jobs, through: :user_houses
>>>>>>> fc85f3f763c1216218f60bc60061f301582bfaf7
end
