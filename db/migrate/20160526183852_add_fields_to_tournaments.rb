class AddFieldsToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :street, :string
    add_column :tournaments, :city, :string
  end
end
