class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
    remove_column :tournaments, :deadline
  end
end
