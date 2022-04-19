require 'rails_helper'

RSpec.describe 'The House Facade' do
  it ".find_houses" do
    VCR.use_cassette("House Facade") do

      houses = HouseFacade.find_houses("Houston", 999999999999999)
      expect(houses).to be_instance_of(Array)
      expect(houses.first).to be_instance_of(HousePoro)
      expect(houses.length).to eq(13)
    end
  end
end
