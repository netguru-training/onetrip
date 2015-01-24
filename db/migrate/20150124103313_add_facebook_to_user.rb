class AddFacebookToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :date
  end
end
