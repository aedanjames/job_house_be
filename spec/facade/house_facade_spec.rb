require 'rails_helper'

RSpec.describe 'The House Facade' do
  xit ".find_houses" do
    results = File.read('spec/fixtures/houses_atherton_zip.json')

    stub_request(:get, "https://api.gateway.attomdata.com/property/address?94027=82009&page=1&pagesize=100").
             with(
               headers: {
           	  'Accept'=>'*/*',
           	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
           	  'User-Agent'=>'Faraday v2.2.0'
               }).
             to_return(status: 200, body: results, headers: {})
    houses = HouseFacade.find_houses(94027)
    expect(houses).to be_instance_of(Array)
    expect(houses.first).to be_instance_of(House)
    expect(houses.length).to eq(100)
  end
end
