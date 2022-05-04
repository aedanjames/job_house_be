class HouseService
  def self.conn
    Faraday.new(url: "https://api.simplyrets.com/") do |faraday|
      faraday.headers['Authorization'] = 'Basic c2ltcGx5cmV0czpzaW1wbHlyZXRz'
      faraday.headers['accept'] = 'application/json'
    end
  end

  def self.get_house_info(location, max_price)
    response = conn.get("/properties?q=#{location[:state]}&maxprice=#{max_price}&count=true")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_single_house(mls_id)
    response = conn.get("/properties/#{mls_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_houses(where, max_price)
      response = conn.get("/properties?q=#{where}&maxprice=#{max_price}&count=true")
      JSON.parse(response.body, symbolize_names: true)


  end
end
