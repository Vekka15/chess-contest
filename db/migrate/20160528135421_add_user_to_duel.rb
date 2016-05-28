class AddUserToDuel < ActiveRecord::Migration
  def change
    add_column :duels, :user_one_id, :integer
    add_column :duels, :user_two_id, :integer
  end
end
