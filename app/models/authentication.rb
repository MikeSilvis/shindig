class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id, :token, :avatar, :username, :refresh_token, :secret
  belongs_to :user
  after_create :import_tweeps, :verify_calendar

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
                           secret: data["credentials"]["secret"],
                           username: data["info"]["nickname"]
                          )
  end

  def self.find_or_create_google(data)
    where(provider: data["provider"],
          uid: data["uid"]
         ).first_or_create(
                            token:data["credentials"]["token"],
                            avatar: data["info"]["image"],
                            username: data["info"]["email"],
                            refresh_token: data["credentials"]["refresh_token"]
                          )
  end

  def self.find_or_create_facebook(data)
      where(token: data["uid"],
          provider: data["provider"]
         ).first_or_create(
                           avatar: data["info"]["image"],
                           uid: data["uid"],
                           username: data["info"]["nickname"]
                          )
  end

  def import_tweeps
    Thread.new do
      PullTweets.perform(user_id) if provider == "twitter"
    end
    # Resque.enqueue(PullTweets, user_id) if provider == "twitter"
  end

  def verify_calendar
    if provider == "google"
      user.attendees.each do |attendee|
        Thread.new { PullAvailabilityAttendee.perform(attendee.id) }
        # Resque.enqueue(PullAvailabilityAttendee, attendee.id)
      end
    end
  end

end