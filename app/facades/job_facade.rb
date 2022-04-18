class JobFacade
  def self.find_jobs(where)
    jobs = JobService.get_job_info(where)

    jobs[:results].map do |job_info|
      JobPoro.new(job_info)
    end
  end
end
