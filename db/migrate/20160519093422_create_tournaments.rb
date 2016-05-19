class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.datetime :time
      t.integer :participation_limit
      t.integer :deadline

      t.timestamps null: false
    end
  end
end
