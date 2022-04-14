class JobService

  def self.get_url(url, city = nil, state = nil)
    conn = Faraday.new(url: 'https://api.adzuna.com/v1/api') do |faraday|
      faraday.params[:app_id] = "5e859b54"
      faraday.params[:app_key] = "9b7837242edf32ddec42da936025659e"
      faraday.params[:salary_min] = 100000
      faraday.params[:salary_max] = 200000
      faraday.params[:location0] = "us"
      faraday.params[:location1] = state
      faraday.params[:location2] = city
    end

    response = conn.get(url)
    help_me = JSON.parse(response.body, symbolize_names: true)
  end 

  def self.get_job_info(city, state)
    get_url('/v1/api/jobs/us/search/1', state, city)
  end
end

