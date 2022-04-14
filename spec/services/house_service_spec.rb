require 'rails_helper'

RSpec.describe 'house service' do
  it 'can connect to a house api' do
    results = File.read('spec/fixtures/houses_atherton_zip.json')

    zipcode = 94027

    stub_request(:get, "https://api.gateway.attomdata.com/property/address?94027=82009&page=1&pagesize=100").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.2.0'
           }).
         to_return(status: 200, body: results, headers: {})

     search = HouseService.get_house_info(zipcode)
     
    expect(search).to be_a(Hash)
  end
end
