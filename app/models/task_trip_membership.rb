class TaskTripMembership < ActiveRecord::Base
  belongs_to :task
  belongs_to :trip_membership
end
