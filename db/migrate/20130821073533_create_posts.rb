class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.integer 	 :updated_epoch
  		t.text 			 :post_json
  		t.references :card

  		t.timestamps
  	end
  end
end
