require 'spec_helper'

describe "Possible Times", type: :api do
	before(:each) do
		Event.any_instance.stub(:generate_google_url).and_return(true)
		Event.any_instance.stub(:geocode_data).and_return(true)
		Api::V1::PossibleTimesController.any_instance.stub(:current_user).and_return(FactoryGirl.create(:user))
		Api::V1::PossibleTimesController.any_instance.stub(:require_login).and_return(true)
	end
	let(:time_start) { Time.new }
	let(:current_user) { FactoryGirl.create(:user)}
	let(:event) { FactoryGirl.create(:event, user: current_user)}
	let!(:pt) { PossibleTime.create(time_start: time_start, time_end: Time.new, event_id: event.id)}
	describe "#index" do
		it "returns possible times for a given event" do
			visit api_v1_event_possible_times_path(event.id, "json")
			page.should have_content "total_attendees"
		end
	end
	describe "#show" do
		it "shows a specific possible time" do
			visit api_v1_event_possible_time_path(event.id, pt.id, "json")
			page.should have_content "total_attendees"
		end
	end
	describe "#create" do
		it "creates a possible time" do
			post api_v1_event_possible_times_path(event.id, "json"), possible_time: { time_start: "6/26/2012 1:30am EDT", time_end: "6/26/2012 1:30am EDT"}
		end
	end
end