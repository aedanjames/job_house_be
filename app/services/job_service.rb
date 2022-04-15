class JobService
  def self.get_url(url, city = nil, state = nil)
    conn = Faraday.new(url: 'https://api.adzuna.com') do |faraday|
    # conn = Faraday.new(url: 'https://api.adzuna.com/v1/api/jobs/us/search/1') do |faraday|
      faraday.params[:app_id] = ENV['app_id']
      faraday.params[:app_key] = ENV['app_key']
      faraday.params[:salary_min] = 0
      faraday.params[:salary_max] = 10000000
      faraday.params[:location0] = "us"
      faraday.params[:location1] = state
      faraday.params[:location2] = city
      faraday.params[:results_per_page] = 50
    end
    response = conn.get(url)
    help_me = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_job_info(city, state)
    # get_url('/v1/api/jobs/us/search/1', state, city)
    get_url('/v1/api/jobs/us/search/1', state, city)
  end
end
