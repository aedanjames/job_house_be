class JobFacade
  def self.find_jobs(state, city)
    jobs = JobService.get_job_info(state, city)

    jobs[:data].map do |job_info|
      Job.new(job_info)
    end
  end
end
