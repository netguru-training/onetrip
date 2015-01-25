class CompletedTripTask < ActiveRecord::Base
  belongs_to :users
  belongs_to :trips
  belongs_to :tasks
end
