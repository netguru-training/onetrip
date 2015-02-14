class Task < ActiveRecord::Base
  validates :content, presence: :true
  belongs_to :user
  belongs_to :category
  has_many :completed_trip_tasks
  
  def done?(task_id, trip_id, user_id)
    CompletedTripTask.exists?(task_id: task_id, trip_id: trip_id, user_id: user_id)
  end
end
