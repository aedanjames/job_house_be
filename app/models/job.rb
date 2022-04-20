class Job < ApplicationRecord
  has_many :user_jobs
  validates_presence_of :company, :location, :contact, :api_job_id
  validates_presence_of :salary, numericality: true

  def location_hash
    split = location.split(',')
    hash = {
      city: split[0],
      state: split[1]
    }
    return hash 
  end
end
