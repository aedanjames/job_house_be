class UserHouseJob < ApplicationRecord
  belongs_to :user_house
  belongs_to :job
end
