require 'faraday'
require 'json'

class GoogleCalendar
  attr_accessor :client, :token, :user_email, :time_start, :time_end
  CALENDAR_URL = '/calendar/v3/freeBusy?fields=calendars&key=15981128324.apps.googleusercontent.com'

  def initialize(token, user_email, time_start, time_end)
    @token = "Bearer #{token}"
    @user_email = user_email
    @time_start = time_start
    @time_end = time_end
  end

  def get_availability
    resp = client.post do |req|
             req.url CALENDAR_URL
             req.headers['Content-Type'] = 'application/json'
             req.headers['Authorization'] = token
             req.body = body.to_json
          end
     resp.body
  end

  def client
    @client ||= Faraday.new(:url => 'https://www.googleapis.com') do |faraday|
                faraday.request  :url_encoded
                faraday.response :logger
                faraday.adapter  Faraday.default_adapter
              end
  end

  def body
  {
    items: [
      {
        id: user_email
      }
    ],
      timeMin: Time.utc(2012, 07, 1).round.iso8601(3),
      timeMax: Time.utc(2012, 07, 2).round.iso8601(3)
  }
  end
end