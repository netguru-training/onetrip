class CreateTaskTripMemberships < ActiveRecord::Migration
  def change
    create_table :task_trip_memberships do |t|
      t.integer :task_id
      t.integer :trip_membership_id

      t.timestamps null: false
    end
  end
end
