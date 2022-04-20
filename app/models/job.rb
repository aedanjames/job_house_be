class Job < ApplicationRecord
  has_many :user_jobs
  validates_presence_of :company, :location, :contact, :api_job_id
  # validates_presence_of :salary, numericality: true

  def location_hash
    split = location.split(',')
    hash = {
      city: split[0],
      state: split[1]
    }
    return hash
  end

  def mortgage_calculator
    monthly_budget = (self.salary * 0.3) / 12
    house_price = (monthly_budget * 5.022575) / (0.005 * 6.022575)
    return house_price.to_i
  end
end
