require 'spec_helper'

describe GoogleCalendar do
  let(:token) { "abc123" }
  let(:user_email) { "abc123@gmail.com" }
  let(:time_start) { [2012, 07, 01, 12, 40] }
  let(:time_end) { [2012, 07, 02, 12, 40] }
  let(:g) { GoogleCalendar.new(token, user_email, time_start, time_end) }
  describe "#time_start_formatted" do
    context "When given an array of numbers" do
      it "returns a UTC formatted array" do
        g.time_start_formatted.should == "2012-07-01T12:40:00.000Z"
        g.time_end_formatted.should == "2012-07-02T12:40:00.000Z"
      end
    end
  end
  describe "#body" do
    it "returns an Hash" do
      g.body.should be_a(Hash)
    end
  end
end