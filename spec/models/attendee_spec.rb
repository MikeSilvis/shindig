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
  describe "#is_going_to?(event_id, user_id)" do
    let(:user) { FactoryGirl.create(:user)}
    let(:event) { FactoryGirl.create(:event)}
    let!(:attendee) { Attendee.create(user_id: user.id, event_id: event.id)}
    it "returns true" do
      Attendee.is_going_to?(event.id,user.id).should be_true
    end
    it "returns false" do
      Attendee.is_going_to?(2,2).should be_false
    end
  end

end