class Api::V1::JobsController < ApplicationController
  def index
    jobs = JobFacade.find_jobs(params[:where])
    render json: JobSerializer.new(jobs)
  end

  def create
    response = "{\"id\":\"3031241203\",\"salary\":\"264000\",\"city\":\"Denver\",\"state\":\"Colorado\",\"company\":\"Pinnacol Assurance\",\"contact\":\"https://www.adzuna.com/land/ad/3031241203?se=5nNA3FO_7BGb_FUCEt2eFw\\u0026utm_medium=api\\u0026utm_source=5e859b54\\u0026v=FDB8D528EA6A79B8D27E5BAD6BC29C8B1AFCC7E6\"}"
    job_data = JSON.parse(response, symbolize_names: true)
    user = User.find_by(email: params[:email])
    if user.nil?
      render response: :bad_request
    end

    if Job.find_by(api_job_id: job_data[:api_job_id].to_i)
      job = Job.find_by(api_job_id: job_data[:api_job_id].to_i)
      if UserJob.find_by(job_id: job.id, user_id: user.id)
        render response: 201
      else
        UserJob.create!(job_id: job.id, user_id: user.id)
        render response: 201
      end
    else
      job = Job.create!(salary: job_data[:salary], contact: job_data[:contact], company: job_data[:company], api_job_id: job_data[:id], location: "#{job_data[:city]}, #{job_data[:state]}")
      user_job = UserJob.create!(job_id: job.id, user_id: user.id)
      if job.save && user_job.save
        render response: 201
      else
        render response: :bad_request
      end
    end
  end
end
