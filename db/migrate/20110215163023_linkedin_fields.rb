class LinkedinFields < ActiveRecord::Migration
  def self.up
    add_column :users, :linkedin_token, :string
    add_column :users, :linkedin_secret, :string
  end

  def self.down
    remove_column :users, :linkedin_token
    remove_column :users, :linkedin_secret
  end
end
