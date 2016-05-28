class AddTournamentToDuel < ActiveRecord::Migration
  def change
    add_reference :duels, :tournament, index: true, foreign_key: true
  end
end
