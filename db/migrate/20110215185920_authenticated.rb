class Authenticated < ActiveRecord::Migration
  def self.up
    add_column :users, :facebook_authenticated, :boolean
    add_column :users, :twitter_authenticated, :boolean
    add_column :users, :linkedin_authenticated, :boolean
  end

  def self.down
    remove_column :users, :facebook_authenticated
    remove_column :users, :twitter_authenticated
    remove_column :users, :linkedin_authenticated
  end
end
