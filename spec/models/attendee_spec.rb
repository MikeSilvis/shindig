require 'spec_helper'

describe Attendee do
  describe "#add_event" do
    let(:event) { Event.create(name: "Mike", description: "woo")}
    it "creates an event from a token" do
      Attendee.add_event(event.token)
      Attendee.last.event_id.should == event.id
    end
  end
end