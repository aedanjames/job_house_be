class RemoveStringFromJobs < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :string, :string
  end
end
