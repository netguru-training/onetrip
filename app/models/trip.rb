class Trip < ActiveRecord::Base
  before_create :generate_code
  
  geocoded_by :start_address, latitude: :start_latitude, longitude: :start_longitude
  geocoded_by :end_address, latitude: :end_latitude, longitude: :end_longitude

  after_validation :geocode
  
  belongs_to :owner, class_name: 'User'
  
  has_many :users, through: :trip_memberships
  has_many :trip_memberships, dependent: :destroy
  
  has_many :categories, through: :trip_categories
  has_many :trip_categories, dependent: :destroy

  
  validates_presence_of :title,
                        :description,
                        :start_address,
                        :end_address,
                        :contributors_limit,
                        :start_time,
                        :end_time

  scope :find_by_code, ->(trip_code) { where(trip_code: trip_code) }
  
  validate :validate_max_members
  
  validate :correct_datetime
  validate :dates_chronological

  accepts_nested_attributes_for :categories

  private

    def correct_datetime
      errors.add(:start_time, 'must be a valid datetime') if ((DateTime.parse(start_time.to_s) rescue ArgumentError) == ArgumentError)      
      errors.add(:end_time, 'must be a valid datetime') if ((DateTime.parse(end_time.to_s) rescue ArgumentError) == ArgumentError)
    end

    def dates_chronological
      errors.add(:end_time, 'must be later than start date') if (start_time > end_time)
    end

    def generate_code
      self.trip_code = SecureRandom.hex(10)
    end
    
    def validate_max_members
      if self.contributors_limit <= self.users.size
        errors.add(:contributors_limit, 'Max limit reached!')
      end
    end

end
