class AddIsPrimaryToCards < ActiveRecord::Migration
  def change
  	add_column :cards, :is_primary, :boolean
  end
end