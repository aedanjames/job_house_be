class JobsController < ApplicationController
  def index
    @jobs = JobFacade.find_jobs(state, city)
  end
end
