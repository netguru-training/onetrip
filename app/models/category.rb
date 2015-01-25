class Category < ActiveRecord::Base
  has_many :trips, through: :trip_categories
  has_many :trip_categories
  has_many :tasks

  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false

end
