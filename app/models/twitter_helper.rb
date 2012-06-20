module TwitterHelper
  def twitter_client
    return nil unless twitter
    @twitter_client ||= Twitter::Client.new(:consumer_key => TWITTER_KEY,
                                            :consumer_secret => TWITTER_SECRET,
                                            :oauth_token => twitter.token,
                                         :oauth_token_secret => twitter.secret)
  end

  def send_dm(username, content)
    twitter_client.direct_message_create(username, content)
  end

  def get_followers
    twitter_ids.collect { |twitter_id| get_twitter_user(twitter_id) }
  end

  def get_twitter_user(twitter_id)
    twitter_client.user(twitter_id)
  end

  def save_followers
    get_followers.each do |t|
        twitter_followers.create(name: t.name, username: t.screen_name,
                                 avatar: t.profile_image_url)
    end
  end

  def twitter_ids
    twitter_client.follower_ids.ids
  end

end