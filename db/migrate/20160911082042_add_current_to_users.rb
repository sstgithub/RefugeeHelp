class AddCurrentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current, :boolean
  end
end
