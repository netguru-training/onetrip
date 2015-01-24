class Trip < ActiveRecord::Base
  geocoded_by :start_address, latitude: :start_latitude, longitude: :start_longitude
  geocoded_by :end_address, latitude: :end_latitude, longitude: :end_longitude

  after_validation :geocode  

  has_one :owner, class_name: 'User'
  # has_many_and_belongs_to_many :contributors, class_name: 'User'

end
