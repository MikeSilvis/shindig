require 'spec_helper'
describe TwitterFollower do
  include TwitterSupport
  let(:ids) {  TwitterSupport::get_ids() }
  let(:followers) { TwitterSupport::get_followers() }
  let(:user) { User.new }
  context "can save followers" do
    before(:each) do
      user.stub(:twitter_ids).and_return(ids)
      user.stub(:get_followers).and_return(followers)
    end
    it "returns twitter ids" do
      user.twitter_ids.first.should == 612476110
      user.twitter_ids.should be_a(Array)
    end
    it "Gets the followers from ids" do
      user.get_followers.first.name.should == "asenova mirena"
      # user.get_followers.should be_a(Array)
    end
  end

end
