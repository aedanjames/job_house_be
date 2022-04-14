class Job
  attr_reader :salary_min,
              :salary_max,
              :state,
              :city,
              :company,
              :apply,
              :id

  def initialize(job_info)
    @salary_min = job_info[:salary_min]
    @salary_max = job_info[:salary_max]
    @state = job_info[:location][:area][1]
    @city = job_info[:location][:area][2]
    @company = job_info[:company][:display_name]
    @apply = job_info[:redirect_url]
    @id = job_info[:id]
  end

  def salary_avg
    (@salary_max + @salary_min)/2
  end
end
