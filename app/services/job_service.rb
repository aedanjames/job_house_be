class JobService
  def self.get_url(url, where, what, salary_min)
    conn = Faraday.new(url: 'https://api.adzuna.com') do |faraday|
      faraday.params[:app_id] = ENV['job_app_id']
      faraday.params[:app_key] = ENV['job_app_key']
      faraday.params[:salary_min] = salary_min
      faraday.params[:salary_max] = 10000000
      faraday.params[:where] = where
      faraday.params[:results_per_page] = 50
      faraday.params[:what] = what unless what == nil
    end
    response = conn.get(url)
    help_me = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_job_info(where, what, salary_min)
    get_url('/v1/api/jobs/us/search/1', where, what, salary_min)
  end
end
