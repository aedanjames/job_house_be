require "rails_helper"

RSpec.describe HousePoro do
  it "exists with attributes" do
    data = {:privateRemarks=>
  "This property is a trial property to test the SimplyRETS. Private agent remarks will be included in this field for use in the SimplyRETS REST API. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
 :showingContactName=>nil,
 :property=>
  {:roof=>"Tile",
   :cooling=>nil,
   :style=>"Traditional",
   :area=>1043,
   :bathsFull=>5,
   :bathsHalf=>6,
   :stories=>3,
   :fireplaces=>1,
   :flooring=>nil,
   :heating=>"Radiant Heat",
   :bathrooms=>nil,
   :foundation=>"Slab",
   :laundryFeatures=>"Area,Electric Dryer Hookup,Individual Room,Washer Hookup",
   :occupantName=>nil,
   :ownerName=>nil,
   :lotDescription=>"Private Backyard",
   :pool=>"Association,Private,In Ground",
   :subType=>nil,
   :bedrooms=>2,
   :interiorFeatures=>"Drapes/Curtains/Window Cover, Fire/Smoke Alarm, High Ceiling, Island Kitchen",
   :lotSize=>"127X146",
   :areaSource=>"Floorplans",
   :maintenanceExpense=>nil,
   :additionalRooms=>"Recreation,Master Bedroom,See Remarks",
   :exteriorFeatures=>"Back Yard Fenced, Covered Patio/Deck, Patio/Deck",
   :water=>nil,
   :view=>"Golf Course",
   :lotSizeArea=>nil,
   :subdivision=>"Waterstone Springs",
   :construction=>"In Kitchen,Stackable,Washer Included",
   :parking=>{:leased=>nil, :spaces=>6, :description=>"Garage Door Opener,Public,Garage,Side by Side"},
   :lotSizeAreaUnits=>nil,
   :type=>"RES",
   :garageSpaces=>8.74556425245327,
   :bathsThreeQuarter=>nil,
   :accessibility=>"Manned Gate",
   :acres=>nil,
   :occupantType=>nil,
   :subTypeText=>nil,
   :yearBuilt=>1998},
 :mlsId=>1005192,
 :showingContactPhone=>nil,
 :terms=>"Conventional",
 :showingInstructions=>
  "The showing instructions for this trial property are brought to you by the SimplyRETS team. This field will include any showing remarks for the given listing in your RETS feed. Enjoy!",
 :office=>{:contact=>{:email=>"info-office@example.com", :office=>"(582) 242-9591", :cell=>nil}, :name=>nil, :servingName=>nil, :brokerid=>nil},
 :leaseTerm=>nil,
 :disclaimer=>"This information is believed to be accurate, but without warranty.",
 :specialListingConditions=>nil,
 :originalListPrice=>nil,
 :address=>
  {:crossStreet=>"Dunne Ave",
   :state=>"Texas",
   :country=>"United States",
   :postalCode=>"77096",
   :streetName=>"East Sweet Bottom Br",
   :streetNumberText=>"74434",
   :city=>"Houston",
   :streetNumber=>74434,
   :full=>"74434 East Sweet Bottom Br #18393",
   :unit=>"18393"},
 :agreement=>"Purchaser Exemptions",
 :listDate=>"2011-05-23T18:50:30.184391Z",
 :agent=>{:officeMlsId=>nil, :lastName=>"Phelps", :contact=>{:email=>"agent@example.com", :office=>"(825) 907-4024", :cell=>nil}, :address=>nil, :modified=>nil, :firstName=>"Shoshana", :id=>"sphelps"},
 :modified=>"2015-11-14T17:57:26.262392Z",
 :school=>{:middleSchool=>"FALCON PASS", :highSchool=>"Cy Creek", :elementarySchool=>"HAYES", :district=>nil},
 :photos=>["https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home9.jpg", "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home-inside-9.jpg"],
 :listPrice=>20714261,
 :internetAddressDisplay=>nil,
 :listingId=>"49699701",
 :mls=>{:status=>"Active", :area=>"Spring/Klein", :daysOnMarket=>862, :originalEntryTimestamp=>nil, :originatingSystemName=>nil, :statusText=>"½~\u0094Y\u0090i", :areaMinor=>nil},
 :internetEntireListingDisplay=>nil,
 :geo=>
  {:county=>"North",
   :lat=>29.689418,
   :lng=>-95.474464,
   :marketArea=>"Spring/Klein",
   :directions=>"From 290 exit Barker Cypress to left on Tuckerton, right on Danbury Bridge, right on Bending Post, right on Driftwood Prairie"},
 :tax=>{:taxYear=>1981, :taxAnnualAmount=>3180, :id=>"593-723-781-8056"},
 :coAgent=>{:officeMlsId=>nil, :lastName=>nil, :contact=>{:email=>"coagent@example.com", :office=>"(556) 750-9377", :cell=>nil}, :address=>nil, :modified=>nil, :firstName=>nil, :id=>"ACME12"}}

    house = HousePoro.new(data)

    expect(house).to be_an_instance_of(HousePoro)

    expect(house.list_price).to be_instance_of(Integer)
    expect(house.list_price).to eq(20714261)

    expect(house.address).to be_an_instance_of(String)
    expect(house.address).to eq("74434 East Sweet Bottom Br #18393")

    expect(house.contact).to be_instance_of(String)
    expect(house.contact).to eq("agent@example.com")

    expect(house.api_house_id).to be_instance_of(Integer)
    expect(house.api_house_id).to eq(1005192)
  end
end
