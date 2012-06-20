class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id, :token, :secret
  belongs_to :user

  SERVICES.each do |service|
    define_singleton_method "add_#{service}".to_sym do |data|
      user = User.send("create_#{service}".to_sym, data[:info])
      # Login User
      Authentication.send("create_#{service}".to_sym, data, user)
    end
  end

  def self.create_twitter(data, user)
    user.authentications.create(
                                 provider: data["provider"],
                                 token: data["credentials"]["token"],
                                 secret: data["credentials"]["secret"]
                                )
  end

end
