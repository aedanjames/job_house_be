class JobsController < ApplicationController
  def index
    @houses = JobFacade.find_jobs(state, city)
  end
end
