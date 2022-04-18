class AddSalaryMinToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :salary_min, :string
  end
end
