require 'spec_helper'
describe "Message", :type => :api do
	let(:current_user) { FactoryGirl.create(:user)}
	let(:event) { FactoryGirl.create(:event, user: current_user)}
	let!(:message) { current_user.messages.create(:content => "whoops", event_id: event.id)}
	before(:each) do
		MessagesController.any_instance.stub(:current_user).and_return(FactoryGirl.create(:user))
		MessagesController.any_instance.stub(:require_login).and_return(true)
	end
	describe "#index" do
		it "returns messages" do
			visit event_messages_path(event.id, 'json')
			page.should have_content "whoops"
		end
	end
	describe "#show" do
		it "returns a message" do
			visit event_message_path(event.id, message.id, 'json')
			page.should have_content "whoops"
		end
	end
	describe "#create" do
		it "creates a message" do
			post event_messages_path(event.id, "json"), message: { content: "Weee" }
			response.status.should == 201
		end
	end
end