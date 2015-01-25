class AddFieldToCompletedTripTasks < ActiveRecord::Migration
  def change
    add_column :completed_trip_tasks, :user_id, :integer
  end
end
