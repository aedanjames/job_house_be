class HouseFacade
  def self.find_houses(location, max_price)
    # max_price = mortgage_calculator(salary)
    houses = HouseService.get_house_info(location, max_price)
    houses.map do |house_info|
      HousePoro.new(house_info)
    end
  end

  def mortgage_calculator(salary)
    monthly_budget = (salary * 0.3)/12
    house_price = (monthly_budget * 5.022575) / (0.005 * 6.022575)
    return house_price
  end
end
