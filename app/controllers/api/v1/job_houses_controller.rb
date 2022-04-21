class Api::V1::JobHousesController < ApplicationController
  def index
    job = Job.find(params[:id])
    #sad path; ID not found
    houses = HouseFacade.find_houses(job.location_hash, job.mortgage_calculator)
    #sad path; location hash?
    #sad path; price?
    #sad path; no houses found?

    render json: JobHouseSerializer.new(houses)
  end

  def show
    user = User.find_by(email: params[:email])
    #sad path; email not found
    user_job = UserJob.find_by(user_id: user.id, job_id: params[:job_id])
    #sad path; job id not found
    #sad path; user_job not found
    houses = user_job.user_job_houses
    saved_homes = HouseFacade.find_saved_homes(houses)
    #sad path; no homes found?
    render json: JobHouseSerializer.new(saved_homes)
  end

  def create
    user = User.find_by(email: params[:email])
    #sad path; email not found
    user_job = UserJob.find_by(user_id: user.id, job_id: params[:job_id])
    #sad path; job id not found
    #sad path; user_job not found
    user_job_house = user_job.user_job_houses.create!(house_id: params[:mls_id])
    #sad path; mls_id not found
    render status: 201
  end

  def destroy
    user = User.find_by(email: params[:email])
    job = Job.find(params[:job_id])
    user_job = UserJob.find_by(user_id: user.id, job_id: job.id)
    house = user_job.user_job_houses.find_by(house_id: params[:house_id])

    house.destroy
    render status: 200
  end
end
