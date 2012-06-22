class RefreshGoogleToken
  attr_accessor :client, :google_account

  def initialize(google_account)
    @google_account = google_account
  end

  def get_new_token
    refresh_token = google_account.refresh_token.gsub("/", "%2F")
    resp = client.post do |req|
             req.url "/o/oauth2/token"
             req.body = "client_secret=#{GOOGLE_SECRET}&grant_type=refresh_token&refresh_token=#{refresh_token}&client_id=#{GOOGLE_KEY}"
           end
    JSON.parse(resp.body)
  end

  def save_token
    google_account.token = get_new_token["access_token"]
    google_account.save
  end

  def client
    Faraday.new(:url => "https://accounts.google.com") do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end
end