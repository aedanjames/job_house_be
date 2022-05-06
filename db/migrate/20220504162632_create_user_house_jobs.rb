class CreateUserHouseJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_house_jobs do |t|
      t.references :user_house, foreign_key: true
      t.references :job, foreign_key: true
    end
  end
end
