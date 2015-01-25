class TripCategory < ActiveRecord::Base
  belongs_to :trip
  belongs_to :category

  validates_presence_of :trip_id, :category_id
  
  validates_uniqueness_of :category_id, scope: :trip_id

end
