class CreateBoardCards < ActiveRecord::Migration
  def change
    create_table :board_cards do |t|
    	t.index :board
    	t.index :card

      t.timestamps
    end
  end
end
