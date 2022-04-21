class Api::V1::UserJobsController < ApplicationController
  def destroy
    UserJob.find_by(user_id: params[:user_id], job_id: params[:job_id]).destroy
    render response: 200
  end
end
