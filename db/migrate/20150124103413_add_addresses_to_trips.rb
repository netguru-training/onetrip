class AddAddressesToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :start_address, :string
    add_column :trips, :end_address, :string
  end
end
