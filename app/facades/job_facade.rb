class JobFacade
  def self.find_jobs(state, city)
    jobs = JobService.get_job_info(state, city)
    
    jobs[:results].map do |job_info|
      Job.new(job_info)
    end
  end
end
