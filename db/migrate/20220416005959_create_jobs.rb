class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :salary
      t.string :string
      t.string :location
      t.string :contact
    end
  end
end
