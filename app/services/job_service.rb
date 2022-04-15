class JobService
  def self.get_url(url, where = nil)
    conn = Faraday.new(url: 'https://api.adzuna.com') do |faraday|
      faraday.params[:app_id] = ENV['job_app_id']
      faraday.params[:app_key] = ENV['job_app_key']
      faraday.params[:salary_min] = 1
      faraday.params[:salary_max] = 10000000
      faraday.params[:where] = where
      faraday.params[:results_per_page] = 50
    end
    response = conn.get(url)

    help_me = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_job_info(where)
    get_url('/v1/api/jobs/us/search/1', where)
  end
end
