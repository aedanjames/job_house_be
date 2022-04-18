class HousesController < ApplicationController
  def index
    @houses = HouseFacade.find_houses(price)
  end
end
