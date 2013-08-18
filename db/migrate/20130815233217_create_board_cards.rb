class CreateBoardCards < ActiveRecord::Migration
  def change
    create_table :board_cards do |t|
    	t.belongs_to :board
    	t.belongs_to :card

      t.timestamps
    end
  end
end
