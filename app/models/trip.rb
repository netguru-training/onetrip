class Trip < ActiveRecord::Base
  before_create :generate_code
  
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

  scope :find_by_code, ->(trip_code) { where(trip_code: trip_code) }
  
  def generate_code
    self.trip_code = SecureRandom.hex(10)
  end
end
