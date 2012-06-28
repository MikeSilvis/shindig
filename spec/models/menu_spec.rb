require 'spec_helper'

describe Menu do
	before(:each) do
		Attendee.any_instance.stub(:find_availability).and_return(true)
	end
	let!(:new_menu) { Menu.create() }
	let!(:attendee) { Attendee.create(menu_id: new_menu.id)}
	describe "#liked_count" do
		it "should return liked count" do
			new_menu.liked_count.should == 1
		end
	end
end