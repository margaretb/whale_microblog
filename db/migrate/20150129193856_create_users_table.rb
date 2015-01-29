class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :fname
      t.string :species
      t.integer :age
      t.string :location
    end
  end
end
