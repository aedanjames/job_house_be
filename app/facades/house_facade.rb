class HouseFacade
  def self.find_houses(location, max_price)
    houses = HouseService.get_house_info(location, max_price)
    houses.map do |house_info|
      HousePoro.new(house_info)
    end
  end

  def self.find_saved_homes(houses)
    saved_homes = houses.map do |house|
      HouseService.get_single_house(house.house_id)
    end

    saved_homes.map do |house_info|
      HousePoro.new(house_info)
    end
  end
end
