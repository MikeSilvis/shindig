class Share
	attr_accessor :client

	def initialize(user)
		@client = TwitterApi.new(user.twitter_token, user.twitter_secret)
	end

	def self.tweet(user, content, event_id)
		s = Share.new(user)
		message = s.add_event_link(content, event_id)
		s.tweet(message)
	end

	def tweet(message)
		@client.tweet(message)
	end

	def add_event_link(content, event_id)
		event = Event.find(event_id)
		"#{content} #{event.google_url}"
	end

end