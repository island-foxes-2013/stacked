class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
    	t.string :name
    	t.string :twitter_handle
    	t.string :slug, :null => false
    	t.belongs_to :user

      t.timestamps
    end

    add_index :cards, :slug, :unique => true
  end
end
