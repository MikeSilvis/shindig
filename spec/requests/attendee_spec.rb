require 'spec_helper'

describe "Attendee Request", :type => :api do
	before(:each) do
		Event.any_instance.stub(:generate_google_url).and_return(true)
		Event.any_instance.stub(:geocode_data).and_return(true)
		Api::V1::EventsController.any_instance.stub(:current_user).and_return(current_user)
		Api::V1::AttendeesController.any_instance.stub(:current_user).and_return(current_user)
		Api::V1::AttendeesController.any_instance.stub(:require_login).and_return(true)
	end
	let!(:current_user) { FactoryGirl.create(:user)}
	let!(:event) { FactoryGirl.create(:event, user: current_user)}
	let!(:attendee) { Attendee.create(event_id: event.id, user_id: FactoryGirl.create(:user).id)}
	let!(:attendee2) { Attendee.create(event_id: event.id, user_id: FactoryGirl.create(:user).id)}
	describe "#update" do
		it "updates an attendee" do
	  	put api_v1_event_attendee_path(event.id, attendee.id, "json"), attendee: { menu_id: 1}
	  	response.status.should == 200
		end
	end
	describe "#index" do
		it "returns all attendees" do
			visit api_v1_event_attendees_path(event.id, "json")
			page.should have_content attendee2.id
		end
	end
	describe "#show" do
		it "returns a single attendee" do
			visit api_v1_event_attendee_path(event.id, attendee.id, "json")
			page.should have_content attendee.user_id
		end
	end
	describe "#new" do
		it "adds a user to the event" do
			visit new_event_attendee_path(event.token)
			page.should have_content event.name
		end
	end
	describe "#current_attendee" do
		it "returns current attendee" do
			visit current_api_v1_event_attendees_path(event.id, "json")
			page.should have_content current_user.id
		end
	end
end