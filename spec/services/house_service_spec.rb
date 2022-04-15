require 'rails_helper'

RSpec.describe 'house service' do
  it 'can connect to a house api' do
    VCR.use_cassette("sf houses") do
      houses = HouseService.get_house_info(82009)
      
      expect(houses).to be_a(Hash)
    end
  end
end
