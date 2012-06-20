require 'spec_helper'

describe TwitterApi do
  let(:api)  { TwitterApi.new(user) }
  let(:user) { User.new }

  describe "#get_followers" do
    it "returns a collection of Twitter users" do
      user.twitter_ids.first.should == 612476110
      user.twitter_ids.should be_a(Array)
    end
  end

end

  # def save_followers
  #   get_followers.each do |t|
  #       twitter_followers.create(name: t.name,
  #                                username: t.screen_name,
  #                                avatar: t.profile_image_url)
  #   end
  # end
