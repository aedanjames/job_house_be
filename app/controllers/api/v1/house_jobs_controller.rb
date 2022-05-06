class Api::V1::HouseJobsController < ApplicationController
  def index
    jobs = HouseFacade.get_house_jobs(params[:api_house_id])
    render json: JobSerializer.new(jobs)
  end
end
