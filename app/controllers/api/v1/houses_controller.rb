class HousesController < ApplicationController
  def index
    @houses = HouseFacade.find_houses(price)
    #30% of salary / 12
    # 
  end
end
