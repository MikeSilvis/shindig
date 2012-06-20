class TwitterApi
  attr_reader :token, :secret, :client_class

  def initialize(token, secret, client_class=Twitter::Client)
    @token        = token
    @secret       = secret
    @client_class = client_class
  end

  def get_users(*twitter_ids)
    twitter_client.user(twitter_ids)
  end

  def tweep_ids
    twitter_client.follower_ids.ids
  end

  def send_dm(username, content)
    twitter_client.direct_message_create(username, content)
  end

  private

  def twitter_client
    @twitter_client ||= client_class.new(oauth_credentials)
  end


  def oauth_credentials
    {
      :consumer_key       => TWITTER_KEY,
      :consumer_secret    => TWITTER_SECRET,
      :oauth_token        => user.twitter.token,
      :oauth_token_secret => user.twitter.secret
    }
  end

end