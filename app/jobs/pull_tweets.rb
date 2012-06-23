class PullTweets
  @queue = :tweets

  def self.perform(user_id)
    TweepImporter.import(User.find(user_id))
  end

end