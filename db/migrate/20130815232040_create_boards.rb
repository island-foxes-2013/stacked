class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
    	t.string :name
    	t.string :description
    	t.string :slug, :null => false

      t.timestamps
    end

    add_index :boards, :slug, :unique => true
  end
end
