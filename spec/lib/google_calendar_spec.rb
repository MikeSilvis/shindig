require 'spec_helper'

# describe GoogleCalendar do
#   let(:user) { double(google: double(token: "hi", refresh_token: "hi"), email: "mike@mike.com" ) }
#   let(:possible_time) { double(event_id: 1, time_end: Time.new(2012, 07, 1), time_start: Time.new(2012, 07, 02)) }
#   let(:g) { GoogleCalendar.new(user, possible_time) }
#   describe "#time_start_formatted" do
#     before(:each) do
#       stub(:RefreshGoogleToken).and_return(true)
#     end
#     context "When given an array of numbers" do
#       it "returns a UTC formatted array" do
#         g.time_end_formatted.should == "2012-07-02T12:40:00.000Z"
#         g.time_start_formatted.should == "2012-07-01T12:40:00.000Z"
#       end
#     end
#   end
#   describe "#body" do
#     it "returns an Hash" do
#       g.body.should be_a(Hash)
#     end
#   end
# end