class Event < ActiveRecord::Base
  attr_accessible :city, :description, :name, :state, :street, :user_id, :zipcode
  validates_presence_of :name, :description
  belongs_to :user
  has_many :attendees
  has_many :messages
  before_create :generate_token
  after_create :add_owner_to_party

  def self.find_from_token(token)
    Event.where(token: token).first
  end

  def generate_token
    self.token = Digest::SHA1.hexdigest(self.name + self.description + rand(10000).to_s)
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

end
