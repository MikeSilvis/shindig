class User < ActiveRecord::Base
  include UserOathHelper
  devise :trackable, :omniauthable

  has_many :authentications
  has_many :users_tweeps
  has_many :tweeps, through: :users_tweeps
  has_many :events
  has_many :attendees
  has_many :possible_attendees
  has_many :messages
  attr_accessible :email, :password, :remember_me, :name, :username, :avatar
  attr_accessor :attendee, :owner
  validates_presence_of :username
  validates_uniqueness_of :username

  def known_tweep_ids
    tweeps.map(&:uid)
  end

  def add_tweep(tweep_user)
    tweeps.build(username: tweep_user[:username],
                 name:     tweep_user[:name],
                 avatar:   tweep_user[:avatar],
                 uid:      tweep_user[:uid])
  end

  def add_tweep!(tweep_user)
    add_tweep(tweep_user)
    save
  end

  def imported_google?
    google != nil
  end

  def self.find_user_and_event_relations(user_id, event_id)
    user = User.where(id: user_id).includes(:attendees).where("attendees.event_id" => event_id).first
    user.attendee = user.attendees.first
    user.owner = user.attendee.owner
    user
  end
end