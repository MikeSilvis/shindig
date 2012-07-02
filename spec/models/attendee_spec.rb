require 'spec_helper'

describe Attendee do
  describe "#add_event" do
  	before(:each) do
  		Event.any_instance.stub(:geocode_data).and_return(true)
      Event.any_instance.stub(:generate_google_url).and_return(true)
  	end
    let!(:event) { FactoryGirl.create(:event)}
    it "creates an event from a token" do
      Attendee.add_event(event.token)
      Attendee.last.event_id.should == event.id
    end
  end
end