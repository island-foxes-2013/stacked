class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
    	t.string :name
    	t.string :twitter_handle

      t.timestamps
    end
  end
end
