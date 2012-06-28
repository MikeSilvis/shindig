class Event < ActiveRecord::Base
  attr_accessible :city, :description, :name, :state, :street, :user_id, :zipcode
  validates_presence_of :name, :description
  belongs_to :user
  has_many :attendees
  has_many :messages
  has_many :menus
  has_many :possible_times
  before_create :generate_token, :generate_google_url
  after_create :add_owner_to_party
  after_create :geocode_data

  def self.find_from_token(token)
    Event.where(token: token).first
  end

  def geocode_data
    result = Geocoder.search("#{self.street}, #{self.zipcode}").first
    if result
      self.latitude   = result.latitude
      self.longitude  = result.longitude
    end
  end

  def generate_token
    self.token = Digest::SHA1.hexdigest(self.name + self.description + rand(10000).to_s)
  end

  def generate_google_url
    googl = Shortly::Clients::Googl
    shorten_url = "http://shindigwith.me/events/#{token}/attendees/new"
    self.google_url = googl.shorten(shorten_url).shortUrl
  end

  def add_owner_to_party
    join_event(user_id)
  end

  def join_event(new_user_id)
    attendees.create(user_id: new_user_id)
  end

  def is_owner?(user)
    user.id == user_id
  end

  def best_time
    possible_times.sort_by(&:possible_attendees_count).first
  end

end