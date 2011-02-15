class FacebookFields < ActiveRecord::Migration
  def self.up
    add_column :users, :facebook_access, :string
  end

  def self.down
    remove_column :users, :facebook_access
  end
end
