class User < ActiveRecord::Base
  devise :trackable, :omniauthable
  validates_presence_of :username
  validates_uniqueness_of :username
  has_many :authentications
  has_many :twitter_followers
  has_many :events
  has_many :attendees

  attr_accessible :email, :password, :remember_me, :name, :username
  include UserOathHelper
  include TwitterHelper

end