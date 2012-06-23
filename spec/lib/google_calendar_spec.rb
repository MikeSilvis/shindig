require 'spec_helper'
class RefreshGoogleToken
  def save_token
    true
  end
end
describe GoogleCalendar do
  let(:user) { double(google: double(token: "hi", refresh_token: "hi"), email: "mike@mike.com" ) }
  let(:possible_time) { PossibleTime.new(event_id: 1, time_start: Time.new(2012, 07, 1), time_end: Time.new(2012, 07, 02)) }
  let(:g) { GoogleCalendar.new(user, possible_time) }
  describe "#body" do
    it "returns an Hash" do
      g.body.should be_a(Hash)
    end
  end
end