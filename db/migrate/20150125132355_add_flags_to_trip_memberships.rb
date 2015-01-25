class AddFlagsToTripMemberships < ActiveRecord::Migration
  def change
    add_column :trip_memberships, :accepted, :boolean, default: false
    add_column :trip_memberships, :rejected, :boolean, default: false
  end
end
