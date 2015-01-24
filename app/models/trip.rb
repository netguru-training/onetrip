class Trip < ActiveRecord::Base
  geocoded_by :start_address, latitude: :start_latitude, longitude: :start_longitude
  geocoded_by :end_address, latitude: :end_latitude, longitude: :end_longitude

  after_validation :geocode  

  belongs_to :owner, class_name: 'User'
  has_many :users, through: :trip_memberships
  has_many :trip_memberships

  validates_presence_of :title,
                        :description,
                        :start_address,
                        :end_address,
                        :contributors_limit,
                        :start_time,
                        :end_time

end
