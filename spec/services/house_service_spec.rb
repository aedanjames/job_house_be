require 'rails_helper'

RSpec.describe 'house service' do
  it 'can connect to a house api' do
    VCR.use_cassette("House Service") do
      houses = HouseService.get_house_info('Houston', 9999999)

      expect(houses).to be_a(Hash)
    end
  end
end
