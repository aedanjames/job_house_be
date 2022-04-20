class HousePoro
  attr_reader :list_price,
              :address,
              :contact,
              :api_house_id,
              :bedrooms,
              :half_baths,
              :full_baths,
              :view,
              :year_built,
              :photos,
              :id

  def initialize(house_data)
    @list_price = house_data[:listPrice]
    @address = house_data[:address][:full]
    @contact = house_data[:agent][:contact][:email]
    @api_house_id = house_data[:mlsId]
    @bedrooms = house_data[:property][:bedrooms]
    @half_baths = house_data[:property][:bathsHalf]
    @full_baths = house_data[:property][:bathsFull]
    @view = house_data[:property][:view]
    @year_built = house_data[:property][:yearBuilt]
    @photos = house_data[:photos]
    @id = house_data[:mlsId]
  end
end
