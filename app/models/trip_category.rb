class TripCategory < ActiveRecord::Base
  belongs_to :trip
  belongs_to :category

  validates_presence_of  :category_id
  validates :trip_id, presence: true, on: :update
  validates_uniqueness_of :category_id, scope: :trip_id

end
