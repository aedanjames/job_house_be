class Api::V1::HousesController < ApplicationController
  def index
    @houses = HouseFacade.find_houses_first(params[:where], params[:max_price])
    render json: JobHouseSerializer.new(@houses)
  end
end
