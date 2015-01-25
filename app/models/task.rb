class Task < ActiveRecord::Base
  validates :content, presence: :true
  belongs_to :user
  has_many :trip_memeberships, through: :task_trip_membership
  has_many :task_trip_membership
end
