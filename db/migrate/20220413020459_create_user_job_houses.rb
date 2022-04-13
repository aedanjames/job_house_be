class CreateUserJobHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_job_houses do |t|
      t.references :user_job, foreign_key: true
      t.integer :house_id
    end
  end
end
