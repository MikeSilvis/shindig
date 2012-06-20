class Event < ActiveRecord::Base
  attr_accessible :city, :description, :name, :state, :street, :user_id, :zipcode
  validates_presence_of :name, :description
  belongs_to :user
  has_many :attendees
  before_create :generate_token
  after_create :add_owner_to_party

  def self.find_from_token(token)
    Event.where(token: token).first
  end

  def generate_token
    self.token = Digest::SHA1.hexdigest(self.name + self.description)
  end

  def add_owner_to_party
    Attendee.create(user_id: user_id, event_id: id)
  end

end
