class Api::V1::JobHousesController < ApplicationController
  def index
    @job = Job.find(params[:id])
    @houses = HouseFacade.find_houses(@job.location_hash, @job.mortgage_calculator)
    # require "pry"; binding.pry
    render json: JobHouseSerializer.new(@houses)
  end
end
