class CompletedTripTask < ActiveRecord::Base
  has_many :users
  has_many :trips
  has_many :tasks
end
