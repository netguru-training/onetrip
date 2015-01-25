class AddFieldsToCompletedTripTasks < ActiveRecord::Migration
  def change
    add_column :completed_trip_tasks, :trip_id, :integer
    add_column :completed_trip_tasks, :task_id, :integer
  end
end
