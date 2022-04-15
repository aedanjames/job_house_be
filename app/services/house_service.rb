class HouseService
  def self.conn
    Faraday.new(url: "https://api.gateway.attomdata.com/propertyapi/v1.0.0/") do |faraday|
      faraday.headers[:APIKey] = ENV['apikey']
      faraday.headers[:accept] = 'application/json'
      faraday.params[:postalcode] = 82009
    end
  end

  def self.get_house_info(zipcode)
    response = conn.get("property/address")
    JSON.parse(response.body, symbolize_names: true)
  end
end
