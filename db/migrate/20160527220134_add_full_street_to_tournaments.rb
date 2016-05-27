class AddFullStreetToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :full_street_address, :string
  end
end
