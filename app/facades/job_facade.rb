class JobFacade
  def self.find_jobs(where = nil, what = nil, salary_min = 10000)
    jobs = JobService.get_job_info(where, what, salary_min)

    jobs[:results].map do |job_info|
      JobPoro.new(job_info)
    end
  end
end
