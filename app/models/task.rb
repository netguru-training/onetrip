class Task < ActiveRecord::Base
  validates :content, presence: :true
  belongs_to :user
  has_many :completed_trip_tasks  
end
