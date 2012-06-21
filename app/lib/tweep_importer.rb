class TweepImporter

  def self.import(user)
    api     = TwitterApi.new(user.twitter_token, user.twitter_secret)
    fetcher = TwitterUserFetcher.new(api, user.known_tweep_ids)

    fetcher.fetch.each do |twitter_user|
      add_tweep_to(user, twitter_user)
    end
  end

  def self.add_tweep_to(user, twitter_user)
      user.add_tweep(:username => twitter_user.screen_name,
                        :name     => twitter_user.name,
                        :avatar   => twitter_user.profile_image_url,
                        :uid      => twitter_user.id)
  end
  private_class_method :add_tweep_to

end
