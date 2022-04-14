class JobService
  def self.conn
    Faraday.new("https://developer.adzuna.com")
  end

  def self.get_job_info(state, city)
    response = conn.get("/v1/api/jobs/us/search/1?app_id=#{ENV['app_id']}&app_key=#{ENV['app_key']}&salary_min=100000&salary_max=200000&location0=us&location1=#{state}&location2=#{city}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
