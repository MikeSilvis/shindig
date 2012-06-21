require 'spec_helper'

class FakeUser
  attr_accessor :tweeps

  def add_tweep!(attrs)
    @tweeps ||= []
    @tweeps << attrs
  end
end

class FakeTwitterUser
  attr_accessor :screen_name, :name, :profile_image_url, :id
end

describe TweepImporter do
  describe "#add_tweep_to" do
    let(:user) { FakeUser.new }
    let(:twitter_user) { FakeTwitterUser.new }

    it "saves fetched tweeps for the user" do
      TweepImporter.send(:add_tweep_to, user, twitter_user)
      user.tweeps.count.should == 1
    end
  end
end
