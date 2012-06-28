require 'spec_helper'

describe "Restaraunt API", :type => :api do
	let(:current_user) { FactoryGirl.create(:user)}
	let(:event) { FactoryGirl.create(:event, user: current_user)}
	let!(:rest) { Restaraunt.create(name: "yo #{rand(100)}")}
	before(:each) do
		RestarauntsController.any_instance.stub(:current_user).and_return(current_user)
		RestarauntsController.any_instance.stub(:require_login).and_return(true)
	end
	describe "#index" do
		it "returns all restaraunts" do
			visit restaraunts_path
			page.should have_content rest.name
		end
	end
	describe "#show" do
		it "returns a restaraunts" do
			visit restaraunt_path(rest.name)
			page.should have_content rest.name
		end
	end
	describe "#search" do
		it "returns a restaraunts array of name" do
			visit search_restaraunts_path
			page.should have_content "yo"
		end
	end
end