class Api::V1::JobsController < ApplicationController
  def index
    jobs = JobFacade.find_jobs(params[:where])
    #sad path; job not found
    #sad path; where param not found
    render json: JobSerializer.new(jobs)
  end

  def show
    job = Job.find(params[:id])
    if job.nil?
      render response: :bad_request
    else
      render json: JobSerializer.new(job)
    end
  end

  def create
    job_data = JSON.parse(params[:job], symbolize_names: true)
    user = User.find_by(email: params[:email])
    if user.nil?
      render response: :bad_request
    end
    if Job.find_by(api_job_id: job_data[:id].to_i)
      job = Job.find_by(api_job_id: job_data[:id].to_i)
      if UserJob.find_by(job_id: job.id, user_id: user.id)
        render json: JobSerializer.new(job), response: 201
      else
        UserJob.create!(job_id: job.id, user_id: user.id)
        render json: JobSerializer.new(job), response: 201
      end
    else
      job = Job.create!(salary: job_data[:salary], title: job_data[:title], contact: job_data[:contact], company: job_data[:company], api_job_id: job_data[:id], location: "#{job_data[:city]}, #{job_data[:state]}")
      user_job = UserJob.create!(job_id: job.id, user_id: user.id)
      if job.save && user_job.save
        render response: 201
      else #can this even happen?
        render response: :bad_request
      end
    end
  end
end
