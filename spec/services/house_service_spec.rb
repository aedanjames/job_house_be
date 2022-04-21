require 'rails_helper'

RSpec.describe 'house service' do
  it 'can connect to a house api' do
    VCR.use_cassette("House Service") do
      location = {
        :city => "Houston",
        :state => "Texas"
      }
      houses = HouseService.get_house_info(location, 9999999)

      expect(houses).to be_an(Array)
    end
  end
end
