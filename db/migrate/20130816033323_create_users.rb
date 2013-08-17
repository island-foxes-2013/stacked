class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :slug, :null => false


      t.timestamps
    end

    add_index :users, :slug, :unique => true
  end
end
