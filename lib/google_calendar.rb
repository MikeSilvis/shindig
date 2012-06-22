require 'faraday'
require 'json'

class GoogleCalendar
  attr_accessor :client, :token, :user_email, :time_start, :time_end, :user
  CALENDAR_URL = '/calendar/v3/freeBusy?fields=calendars&key=15981128324.apps.googleusercontent.com'

  def initialize(user, time_start, time_end)
    RefreshGoogleToken.new(user.google)
    @token = "Bearer #{user.google.token}"
    @user = user
    @user_email = user.email
    @time_start = time_start
    @time_end   = time_end
  end

  def get_availability
    resp = client.post do |req|
             req.url CALENDAR_URL
             req.headers['Content-Type'] = 'application/json'
             req.headers['Authorization'] = token
             req.body = body.to_json
          end
     JSON.parse(resp.body)
  end

  def save_availability
    get_availability["calendars"]["#{user.email}"]["busy"].each do |appt|
      user.availabilities.create!(time_start: Time.parse(appt["start"]),
                                  time_end: Time.parse(appt["end"]))
    end
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
      timeMin: time_start.round.iso8601(3),
      timeMax: time_end.round.iso8601(3)
  }
  end
end