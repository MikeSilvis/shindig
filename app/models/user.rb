class User < ActiveRecord::Base
  devise :trackable, :omniauthable
  validates_presence_of :username
  validates_uniqueness_of :username
  has_many :authentications
  attr_accessible :email, :password, :remember_me, :name, :username

  def self.twitter_hash(data)
    {
      name: data["name"],
      username: data["nickname"]
    }
  end

  def self.google_hash(data)
    {
      name: data["name"],
      username: data["email"],
      email: data["email"]
    }
  end

  def self.verify_from_service(service, data)
    service_hash = User.send("#{service}_hash".to_sym, data)
    User.where(username: data["nickname"]).first_or_create(service_hash)
  end

  SERVICES.each do |service|
    define_singleton_method "verify_#{service}".to_sym do |data|
      user = User.verify_from_service(service, data["info"])
      user.authentications.send("find_or_create_#{service}".to_sym, data)
    end

    define_method "#{service}".to_sym do
      authentications.twitter
    end
  end
end