require 'spec_helper'

describe GoogleCalendar do
  let(:user) { double(google: double(token: "hi") ) }
  let(:time_start) { Time.new(2012, 07, 03, 12, 40) }
  let(:time_end) { Time.new(2012, 07, 02, 12, 40) }
  let(:g) { GoogleCalendar.new(user, time_start, time_end) }
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