class AddDefaultValuesToUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :marketing, :boolean, :default => true
    change_column :users, :articles, :boolean, :default => true
    change_column :users, :digest, :boolean, :default => true
  end
end
