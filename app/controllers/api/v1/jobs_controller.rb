class Api::V1::JobsController < ApplicationController
  def index
    jobs = JobFacade.find_jobs(params[:where])
    render json: JobSerializer.new(jobs)
  end

  def create
    response = "{\"id\":\"3031241203\",\"salary\":\"264000\",\"city\":\"Denver\",\"state\":\"Colorado\",\"company\":\"Pinnacol Assurance\",\"contact\":\"https://www.adzuna.com/land/ad/3031241203?se=5nNA3FO_7BGb_FUCEt2eFw\\u0026utm_medium=api\\u0026utm_source=5e859b54\\u0026v=FDB8D528EA6A79B8D27E5BAD6BC29C8B1AFCC7E6\"}"
    job_data = JSON.parse(response, symbolize_names: true)
    user = User.find_by(email: params[:email])

    if Job.find_by(api_job_id: job_data[:id].to_i)
      # if exists, validate not a duplicate
      # if doesn't exist, create UserJob
      # send 201 response
    else
      Job.create!(job_data)
      # if doesnt exist, create Job
      # create UserJob
      # send 201 response
    end
  end

end
