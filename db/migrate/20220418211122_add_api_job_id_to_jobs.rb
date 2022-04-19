class AddApiJobIdToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :api_job_id, :bigint
  end
end
