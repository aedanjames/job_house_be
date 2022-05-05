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
end
