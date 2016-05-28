class CreateDuels < ActiveRecord::Migration
  def change
    create_table :duels do |t|
      t.integer :win_type_one
      t.integer :win_type_two
      t.references :participation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
