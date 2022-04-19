class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :company
      t.integer :salary
      t.string :string
      t.string :location
      t.string :contact
    end
  end
end
