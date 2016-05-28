class AddParticipationFromDuel < ActiveRecord::Migration
  def change
    add_column :duels, :user_one, :integer
    add_column :duels, :user_two, :integer
  end
end
