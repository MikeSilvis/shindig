require 'spec_helper'

describe "USER", :type => :api do
	before(:each) do
		UsersController.any_instance.stub(:current_user).and_return(FactoryGirl.create(:user))
		UsersController.any_instance.stub(:require_login).and_return(true)
	end

	let!(:event) { FactoryGirl.create(:event) }
	let(:user)  { FactoryGirl.create(:user)  }

	it "returns a user" do
		visit event_user_path(event.id, user.id, format: "json")
  	page.should have_content user.username
	end
end