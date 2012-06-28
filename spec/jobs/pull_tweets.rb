require 'spec_helper'

describe PullTweets
	before(:each) do
		TweepImporter.any_instance.stub(:import).and_return(true)
	end
	it "should recieve" do
		PullTweets.perform(1).should be_true
	end
end