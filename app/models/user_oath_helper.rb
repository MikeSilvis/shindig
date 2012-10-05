module UserOathHelper

  def self.included(klass)
    klass.extend UserOathHelper::ClassMethods
  end

  module ClassMethods
    def twitter_hash(data)
      {
        name: data["name"],
        username: data["nickname"],
        avatar: data["image"]
      }
    end

    def google_hash(data)
      {
        name: data["name"],
        email: data["email"]
      }
    end

    def facebook_hash(data)
      {
        name: data["name"],
        username: data["nickname"],
        email: data["email"],
        avatar: data["image"]
      }

    end

    def verify_from_service(service, data)
      service_hash = User.send("#{service}_hash".to_sym, data)
      User.where(username: username(data).downcase).first_or_create(service_hash)
    end

    def username(data)
      data["nickname"] || data["email"]
    end

    SERVICES.each do |service|
      define_method "verify_#{service}".to_sym do |data|
        user = User.verify_from_service(service, data["info"])
        user.authentications.send("find_or_create_#{service}".to_sym, data)
      end
    end
  end

  SERVICES.each do |service|
    define_method "#{service}".to_sym do
      authentications.send("#{service}".to_sym).first
    end

    define_method "#{service}_token".to_sym do
      authentications.send("#{service}".to_sym).first.token
    end

    define_method "#{service}_secret".to_sym do
      authentications.send("#{service}".to_sym).first.secret
    end

  end

end
