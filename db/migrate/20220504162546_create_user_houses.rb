class CreateUserHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_houses do |t|
      t.references :user, foreign_key: true
      t.integer :house_id
    end
  end
end
