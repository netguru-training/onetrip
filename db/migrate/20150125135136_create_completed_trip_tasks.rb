class CreateCompletedTripTasks < ActiveRecord::Migration
  def change
    create_table :completed_trip_tasks do |t|
      t.string :trip
      t.string :task
      t.timestamps null: false
    end
  end
end
