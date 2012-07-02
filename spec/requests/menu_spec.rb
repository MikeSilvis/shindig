require 'spec_helper'

describe "Menu API", :type => :api do
	before(:each) do
		Event.any_instance.stub(:generate_google_url).and_return(true)
		Event.any_instance.stub(:geocode_data).and_return(true)
		Api::V1::MenusController.any_instance.stub(:current_user).and_return(current_user)
		Api::V1::MenusController.any_instance.stub(:require_login).and_return(true)
	end
	let(:current_user) { FactoryGirl.create(:user)}
	let(:event) { FactoryGirl.create(:event, user: current_user)}
	let!(:rest) { Restaraunt.create(name: "Rest1")}
	let!(:menu) { Menu.create(name: rest.name, event_id: event.id, restaraunt_id: rest.id)}
	describe "#index" do
		it "returns all Menus" do
			visit api_v1_event_menus_path(event.id, "json")
			page.should have_content menu.name
		end
	end
	describe "#show" do
		it "returns a menu" do
			visit api_v1_event_menu_path(event.id, menu.id, "json")
			page.should have_content menu.name
		end
	end
	describe "#create" do
		it "creates a menu" do
			post api_v1_event_menus_path(event.id, "json"), menu: { restaraunt_id: rest.id, name: rest.name }
	  	response.status.should == 201
		end
	end
	describe "#update" do
		it "updates the menu" do
			put api_v1_event_menu_path(event.id, menu.id, "json"), menu: { restaraunt_id: rest.id, name: rest.name }
	  	response.status.should == 200
	  end
	end
end