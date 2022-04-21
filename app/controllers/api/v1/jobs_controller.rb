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
    job = Job.find_by(api_job_id: job_data[:id].to_i)
    # user_job = UserJob.find_by(job_id: job.id, user_id: user.id)
    if user.nil? #user not found ; error
      render :status => 404
    elsif job.nil? #job not found ; must be created
      job = Job.create(salary: job_data[:salary], title: job_data[:title], contact: job_data[:contact], company: job_data[:company], api_job_id: job_data[:id], location: "#{job_data[:city]}, #{job_data[:state]}")
      if job.save #Job created successfully
        user_job = UserJob.create!(job_id: job.id, user_id: user.id)
        render response: 200
      else #Job not created successfully (bad params) ; error
        render :status => 404
      end
    elsif UserJob.find_by(job_id: job.id, user_id: user.id).nil? #job and user found, but no relationship ; must be created
      user_job = UserJob.create!(job_id: job.id, user_id: user.id)
      render response: 200
    else #job and user and user_job exist, no action needed
      render response: 200
    end
  end
end
