class RemoveParticipationFromDuel < ActiveRecord::Migration
  def change
    remove_reference :duels, :participation, index: true, foreign_key: true
  end
end
