class Api::V1::UserHousesController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      render response: :bad_request
    else
      UserHouse.create!(user_id: user.id, house_id: params[:mls_id])
      render response: 201
    end
  end

  def index
    user = User.find_by(email: params[:email])
    houses = user.user_houses
    saved_homes = HouseFacade.find_saved_homes(houses)
    render json: JobHouseSerializer.new(saved_homes)
  end
end
