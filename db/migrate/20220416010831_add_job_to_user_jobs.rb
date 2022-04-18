class AddJobToUserJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_jobs, :job, foreign_key: true
  end
end
