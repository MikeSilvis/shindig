class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id, :token, :secret, :avatar, :username
  belongs_to :user

  SERVICES.each do |service|
    define_singleton_method "add_#{service}".to_sym do |data|
      user = User.send("create_#{service}".to_sym, data["info"])
      Authentication.send("create_#{service}".to_sym, data, user)
      user
    end

    define_singleton_method "#{service}".to_sym do
      where(provider: service).first
    end
  end

  def self.create_twitter(data, user)
    user.authentications.create(
                                 provider: data["provider"],
                                 token: data["credentials"]["token"],
                                 secret: data["credentials"]["secret"],
                                 avatar: data["info"]["image"],
                                 uid: data["uid"],
                                 username: data["info"]["nickname"]
                                )
  end

end
