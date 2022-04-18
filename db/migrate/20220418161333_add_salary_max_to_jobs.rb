class AddSalaryMaxToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :salary_max, :string
  end
end
