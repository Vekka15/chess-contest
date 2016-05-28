class RemoveUserFromDuel < ActiveRecord::Migration
  def change
    remove_column :duels, :user_one, :integer
    remove_column :duels, :user_two, :integer
  end
end
