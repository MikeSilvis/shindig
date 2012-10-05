require 'spec_helper'

describe "Getting an event", :type => :api do
	let(:current_user) { FactoryGirl.create(:user)}
	let(:event) { FactoryGirl.create(:event, user: current_user)}
	before(:each) do
		Event.any_instance.stub(:generate_google_url).and_return(true)
		Event.any_instance.stub(:geocode_data).and_return(true)
		EventsController.any_instance.stub(:current_user).and_return(current_user)
		EventsController.any_instance.stub(:require_login).and_return(true)
		Api::V1::EventsController.any_instance.stub(:current_user).and_return(current_user)
		Api::V1::EventsController.any_instance.stub(:require_login).and_return(true)
	end
	describe "#show" do
		it "shows an event HTML" do
			visit event_path(event.id)
			page.should have_content ("signed in as")
		end
		it "shows content in JSON" do
			visit api_v1_event_path(event.id, format: "json")
			page.should have_content event.name
		end
	end

end