class User < ActiveRecord::Base
  include UserOathHelper

  devise :trackable, :omniauthable

  has_many :authentications
  has_many :users_tweeps
  has_many :tweeps, through: :users_tweeps
  has_many :events
  has_many :attendees

  attr_accessible :email, :password, :remember_me, :name, :username

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

end

