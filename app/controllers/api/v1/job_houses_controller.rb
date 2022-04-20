class JobHousesController < ApplicationController
  def index
    @job = Job.find(params[:id])
    @houses = HouseFacade.find_houses(@job.location, @job.mortgage_calculator)
    # render json:
  end
end
