class Task < ActiveRecord::Base
  validates :content, presence: :true
  belongs_to :user
  belongs_to :completed_trip_tasks  
end
