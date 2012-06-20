class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id, :token, :secret, :avatar, :username
  belongs_to :user

  SERVICES.each do |service|
    define_singleton_method "#{service}".to_sym do
      where(provider: service).first
    end
  end

  def self.lookup_twitter(data)
    where(token: data["credentials"]["token"],
                               provider: data["provider"]
                              ).first_or_create(
                                          secret: data["credentials"]["secret"],
                                          avatar: data["info"]["image"],
                                          uid: data["uid"],
                                          username: data["info"]["nickname"]
                                          )
  end

  def self.lookup_google(data)
    where(token: data["credentials"]["token"],
          provider: data["provider"]
         ).first_or_create(
                            uid: data["uid"],
                            avatar: data["info"]["image"],
                          )
  end

end
