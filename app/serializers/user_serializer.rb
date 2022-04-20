class UserSerializer
  include JSONAPI::Serializer
  attributes :email

  # has_many :jobs, through: :user_jobs
  attribute :jobs do |object|
    object.jobs.map do |job|
      {
        id: job.id,
        salary: job.salary,
        company: job.company,
        location: job.location_hash,
        contact: job.contact,
        api_job_id: job.api_job_id,
        title: job.title,
      }
    end
  end
end
