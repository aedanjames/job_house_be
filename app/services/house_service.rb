class HouseService
  def self.conn
    Faraday.new(url: "https://api.gateway.attomdata.com/")
  end

  def self.get_house_info(zipcode)
    response = conn.get("property/address?#{zipcode}=82009&page=1&pagesize=100")
    JSON.parse(response.body, symbolize_names: true)
  end
end
