class Trip < ActiveRecord::Base
  before_create :generate_code

  before_validation :geocode_everything

  belongs_to :owner, class_name: 'User'

  has_many :users, through: :trip_memberships
  has_many :trip_memberships, dependent: :destroy

  has_many :categories, through: :trip_categories
  has_many :trip_categories, dependent: :destroy

  has_many :completed_trip_tasks

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

  def self.search(category_ids)
    if category_ids.present?
      joins(:trip_categories).where(trip_categories: { category_id: category_ids })
    else
      order("start_time ASC")
    end
  end

  def generate_code
    begin
      self.trip_code = SecureRandom.hex(10)
    end while Trip.exists?(trip_code: trip_code)
  end

  private

  def geocode_everything
    self.start_latitude, self.start_longitude = Geocoder.coordinates(self.start_address)
    self.end_latitude, self.end_longitude = Geocoder.coordinates(self.end_address)
  end

    def correct_datetime
      errors.add(:start_time, 'must be a valid datetime') if ((DateTime.parse(start_time.to_s) rescue ArgumentError) == ArgumentError)
      errors.add(:end_time, 'must be a valid datetime') if ((DateTime.parse(end_time.to_s) rescue ArgumentError) == ArgumentError)
    end

    def dates_chronological
      return if !start_time.present? || !end_time.present?
      errors.add(:end_time, 'must be later than start date') if (start_time > end_time)
    end

    def validate_max_members
      return unless contributors_limit.present?
      if self.contributors_limit <= self.trip_memberships.accepted.size
        errors.add(:contributors_limit, 'Max limit reached!')
      end
    end

end
