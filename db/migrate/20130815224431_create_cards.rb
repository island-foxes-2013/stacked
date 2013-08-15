class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
    	t.string :name
    	t.string :twitter_handle
    	t.belongs_to :board

      t.timestamps
    end
  end
end
