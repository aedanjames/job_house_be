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

  def destroy
    user = User.find_by(email: params[:email])
    user_house = UserHouse.find_by(user_id: user.id, house_id: params[:mls_id])
    if user.nil? || user_house.nil?
      render response: :bad_request
    else
      user_house.destroy
      render response: 200
    end
  end
end
