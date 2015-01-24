class CreateTripMemberships < ActiveRecord::Migration
  def change
    create_table :trip_memberships do |t|
      t.integer :user_id
      t.integer :trip_id

      t.timestamps null: false
    end
  end
end
