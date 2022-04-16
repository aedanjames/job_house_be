class RemoveJobIdFromUserJobs < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_jobs, :job_id, :integer
  end
end
