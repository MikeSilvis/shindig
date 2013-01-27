unless defined?(GOOGLE_KEY) && defined?(TWITTER_KEY)
  TWITTER_KEY = "2yBLkeHyddvYDCkLNvZXQ"
  TWITTER_SECRET = "sbevPXWzNwyrrKOob4poYGlPFGocNYHk7U75QjFcm4"

  FACEBOOK_KEY = "291263487645329"
  FACEBOOK_SECRET = "83dabffa2d4e0c3edd5c676c6dfb9227"

  if Rails.env.production?
  	GOOGLE_KEY = "15981128324-0552ddk1tqq42urulmllmjekts5fdr1k.apps.googleusercontent.com"
	  GOOGLE_SECRET = "Fojfrb9Pqrhsyo0auEpd62LZ"
  else
	  GOOGLE_KEY = "15981128324.apps.googleusercontent.com"
	  GOOGLE_SECRET = "uUzh3l2PiMx8MbrLNgNZRl5E"
	end

end