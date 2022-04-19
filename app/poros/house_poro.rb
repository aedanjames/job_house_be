class HousePoro
  attr_reader :list_price,
              :address,
              :contact,
              :api_house_id

  def initialize(house_data)
    @list_price = house_data[:listPrice]
    @address = house_data[:address][:full]
    @contact = house_data[:agent][:contact][:email]
    @api_house_id = house_data[:mlsId]
  end
end
