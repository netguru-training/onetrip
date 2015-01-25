class TripMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  has_many :tasks, through: :task_trip_membership
  has_many :task_trip_membership

  validates_presence_of :user_id, :trip_id

  validates_uniqueness_of :user_id, scope: :trip_id

end
