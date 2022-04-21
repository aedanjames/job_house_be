class JobHouseSerializer
  include JSONAPI::Serializer
  attributes :id, :list_price, :address, :contact, :api_house_id, :bedrooms, :half_baths, :full_baths, :view, :year_built, :photos
end
