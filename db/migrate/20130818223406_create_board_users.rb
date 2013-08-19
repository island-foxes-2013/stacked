class CreateBoardUsers < ActiveRecord::Migration
  def change 
  	create_table :board_users do |t|
  		t.references :board
  		t.references :user

  		t.timestamps
  	end
  end
end
