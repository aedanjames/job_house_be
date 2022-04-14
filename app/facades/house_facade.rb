class HouseFacade
  def self.find_houses(zipcode)
    houses = HouseService.get_house_info(zipcode)

    houses[:property].map do |house_info|
      House.new(house_info)
    end
  end
end
