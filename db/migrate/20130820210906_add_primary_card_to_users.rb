class AddPrimaryCardToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :primary_card, :integer
  end
end
