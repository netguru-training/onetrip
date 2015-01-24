class AddTripcodeToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :trip_code, :string
  end
end
