class TwitterApi

  def initialize(token, secret, client=nil)
    @client   = client
    @client ||= Twitter::Client.new(oauth_credentials(token, secret))
  end

  def get_users(*twitter_ids)
    @client.users(twitter_ids)
  end

  def friend_ids
    @client.friend_ids.ids
  end

  def follower_ids
    @client.follower_ids.ids
  end

  def tweep_ids
    friend_ids & follower_ids
  end

  def send_dm(username, content)
    @client.direct_message_create(username, content)
  end

  def tweet(content)
    @client.update(content)
  end

  private

  def oauth_credentials(token, secret)
    {
      :consumer_key       => TWITTER_KEY,
      :consumer_secret    => TWITTER_SECRET,
      :oauth_token        => token,
      :oauth_token_secret => secret
    }
  end

end
