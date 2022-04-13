class JobsController < ApplicationController
  def index
    @houses = JobFacade.find_jobs(salary)
  end
end
