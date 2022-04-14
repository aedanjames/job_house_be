class Api::V1::JobsController < ApplicationController
  def index
    jobs = JobFacade.find_jobs(params[:state], params[:city])
    render json: JobSerializer.new(jobs)
  end
end
