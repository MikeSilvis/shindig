class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id, :token, :secret, :avatar, :username, :refresh_token
  belongs_to :user

  SERVICES.each do |service|
    define_singleton_method "#{service}".to_sym do
      where(provider: service).all
    end
  end

  def self.find_or_create_twitter(data)
    where(token: data["credentials"]["token"],
                               provider: data["provider"]
                              ).first_or_create(
                                          avatar: data["info"]["image"],
                                          uid: data["uid"],
                                          username: data["info"]["nickname"]
                                          )
  end

  def self.find_or_create_google(data)
    where(token: data["credentials"]["token"],
          provider: data["provider"]
         ).first_or_create(
                            uid: data["uid"],
                            avatar: data["info"]["image"],
                            username: data["info"]["email"],
                            refresh_token: data["credentials"]["refresh_token"]
                          )
  end

end
