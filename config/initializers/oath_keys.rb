unless defined?(GOOGLE_KEY)
  TWITTER_KEY = "2yBLkeHyddvYDCkLNvZXQ"
  TWITTER_SECRET = "sbevPXWzNwyrrKOob4poYGlPFGocNYHk7U75QjFcm4"

  if Rails.production?
  	GOOGLE_KEY = "15981128324-0552ddk1tqq42urulmllmjekts5fdr1k.apps.googleusercontent.com"
	  GOOGLE_SECRET = "Fojfrb9Pqrhsyo0auEpd62LZ"
  else

	  GOOGLE_KEY = "15981128324.apps.googleusercontent.com"
	  GOOGLE_SECRET = "uUzh3l2PiMx8MbrLNgNZRl5E"
	end
end