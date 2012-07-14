class Event < ActiveRecord::Base
  attr_accessible :city, :description, :name, :state, :street, :user_id, :zipcode
  validates_presence_of :name, :description, :street
  validates_format_of :zipcode, :with => /\d/, :message => "Zipcodes are only digits brah."
  validates_length_of :zipcode, :within => 5..5
  belongs_to :user
  has_many :attendees
  has_many :messages
  has_many :menus
  has_many :possible_times
  has_many :items
  before_create :generate_token, :generate_google_url, :geocode_data
  after_create :add_owner_to_party

  def self.find_from_token(token)
    Event.where(token: token).first
  end

  def geocode_data
    result = Geocoder.search("#{self.street}, #{self.zipcode}").first
    if result
      self.latitude   = result.latitude
      self.longitude  = result.longitude
      self.state      = result.state
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
    join_event(user_id, true)
  end

  def join_event(new_user_id, owner=false)
    attendees.create(user_id: new_user_id, owner: owner)
  end

def is_owner?(user)
    user.id == user_id
  end

  def best_time
    possible_times.sort_by(&:possible_attendees_count).first
  end

  def self.create_from_cookies(cookies)
    Event.create(name: cookies[:name], description: cookies[:description],
                 street: cookies[:street], zipcode: cookies[:zipcode])
  end
end