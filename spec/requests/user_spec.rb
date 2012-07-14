require 'spec_helper'

describe "USER", :type => :api do
	before(:each) do
		Api::V1::UsersController.any_instance.stub(:current_user).and_return(FactoryGirl.create(:user))
		Api::V1::UsersController.any_instance.stub(:require_login).and_return(true)
    Event.any_instance.stub(:geocode_data).and_return(true)
    Event.any_instance.stub(:generate_google_url).and_return(true)
	end
	let!(:event)    { FactoryGirl.create(:event) }
	let(:user)      { FactoryGirl.create(:user)  }
  let!(:attendee) { Attendee.create(user_id: user.id, event_id: event.id)  }

	it "returns a user" do
		visit api_v1_event_user_path(event.id, user.id, format: "json")
  	page.should have_content user.username
	end
end