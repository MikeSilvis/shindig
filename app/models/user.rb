class User < ActiveRecord::Base
  devise :trackable, :omniauthable
  validates_presence_of :username
  has_many :authentications
  attr_accessible :email, :password, :remember_me, :name, :username

  def self.create_twitter(data)
    User.create(name: data[:name], username: data[:nickname])
  end
end