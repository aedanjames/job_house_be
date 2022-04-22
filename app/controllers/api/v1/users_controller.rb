class Api::V1::UsersController < ApplicationController
  def show
    user = User.find_or_create_by(email: params[:email])
    render json: UserSerializer.new(user)
  end
end
