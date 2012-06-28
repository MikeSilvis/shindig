require 'spec_helper'

describe "Attendee Request", :type => :api do
	let(:current_user) { FactoryGirl.create(:user)}
	let(:event) { FactoryGirl.create(:event, user: current_user)}
	let(:attendee) { Attendee.create(event_id: event.id, user_id: current_user.id)}
	before(:each) do
		EventsController.any_instance.stub(:current_user).and_return(current_user)
		AttendeesController.any_instance.stub(:current_user).and_return(current_user)
		AttendeesController.any_instance.stub(:require_login).and_return(true)
	end
	describe "#update" do
		it "updates an attendee" do
	  	put event_attendee_path(event.id, attendee.id, "json"), attendee: { menu_id: 1}
	  	response.status.should == 200
		end
	end
	describe "#index" do
		it "returns all attendees" do
			visit event_attendees_path(event.id, "json")
			page.should have_content current_user.username
		end
	end
	describe "#show" do
		it "returns a single attendee" do
			visit event_attendee_path(event.id, attendee.id, "json")
			page.should have_content attendee.user_id
		end
	end
	describe "#new" do
		it "adds a user to the event" do
			visit new_event_attendee_path(event.id)
			page.should have_content "Radical"
		end
	end
	describe "#current_attendee" do
		it "returns current attendee" do
			visit current_attendee_event_attendees_path(event.id, "json")
			page.should have_content current_user.id
		end
	end
end