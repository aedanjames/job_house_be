class HouseService
  def self.conn
    Faraday.new(url: "https://api.simplyrets.com/") do |faraday|
      faraday.headers['Authorization'] = 'Basic c2ltcGx5cmV0czpzaW1wbHlyZXRz'
      faraday.headers['accept'] = 'application/json'
    end
  end

  def self.get_house_info(location, max_price)
    response = conn.get("/properties?q=#{location[:state]}&maxprice=#{max_price}&count=true")
    binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end
end
