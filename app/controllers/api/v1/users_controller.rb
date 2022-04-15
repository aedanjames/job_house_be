class UserController < ApplicationController
  def show
    render json: User
  end
end
