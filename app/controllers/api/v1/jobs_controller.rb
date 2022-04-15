class Api::V1::JobsController < ApplicationController
  def index
    jobs = JobFacade.find_jobs(params[:where])
    render json: JobSerializer.new(jobs)
  end
end
