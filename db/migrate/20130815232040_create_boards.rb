class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
    	t.string :name
    	t.string :description
    	t.string :slug, :null => false
    	t.belongs_to :user

      t.timestamps
    end

    add_index :boards, :slug, :unique => true
  end
end
