require 'spec_helper'

describe PossibleAttendee, type: :api do
	before(:each) do
		Api::V1::PossibleAttendeesController.any_instance.stub(:current_user).and_return(FactoryGirl.create(:user))
		Api::V1::PossibleAttendeesController.any_instance.stub(:current_user_id).and_return(1)
	end
	let!(:event) { FactoryGirl.create(:event) }
	it "creates a possible attendee" do
  	post api_v1_event_possible_attendees_path(event.id), possible_attendee: { possible_time_id: 1 }
  	response.status.should == 201
	end
end