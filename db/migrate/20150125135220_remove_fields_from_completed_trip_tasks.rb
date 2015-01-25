class RemoveFieldsFromCompletedTripTasks < ActiveRecord::Migration
  def change
    remove_column :completed_trip_tasks, :trip, :string
    remove_column :completed_trip_tasks, :task, :string
  end
end
