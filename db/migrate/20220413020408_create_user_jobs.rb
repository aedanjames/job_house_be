class CreateUserJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_jobs do |t|
      t.references :user, foreign_key: true
    end
  end
end
