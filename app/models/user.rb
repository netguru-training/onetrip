class User < ActiveRecord::Base
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable,
          :omniauthable,
          :omniauth_providers => [:facebook]

  has_many :owned_trips, class_name: 'Trip', foreign_key: :owner_id, dependent: :destroy

  has_many :trips, through: :trip_memberships
  has_many :trip_memberships
  has_many :tasks, dependent: :destroy
  
  has_many :completed_trip_tasks
  
  def self.from_omniauth(auth)
    return_user = self.where(email: auth.info.email).first
    if return_user.present?
      return_user.provider = auth.provider
      return_user.uid = auth.uid
    else
      return_user = self.create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   
        user.image = auth.info.image 
      end
    end
    return_user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def to_s
    self.name || self.email
  end

  def all_trips
    all_trips = []
    all_trips << owned_trips
    all_trips << trips
    all_trips.flatten || []
  end
  
  def has_trips?
    owned_trips.exists?
  end
  
  def joined_trips?
    trip_memberships.exists?
  end
end
