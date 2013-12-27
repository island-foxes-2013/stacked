class AddNicknameToAuthorizations < ActiveRecord::Migration
  def change
  	add_column :authorizations, :nickname, :string
  end
end
