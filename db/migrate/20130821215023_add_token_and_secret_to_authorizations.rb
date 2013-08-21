class AddTokenAndSecretToAuthorizations < ActiveRecord::Migration
  def change
  	add_column :authorizations, :oauth_token, :string
  	add_column :authorizations, :oauth_secret, :string
  end
end
