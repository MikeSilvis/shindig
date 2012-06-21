require 'spec_helper'

describe User do

  describe "#known_tweep_ids" do
    let(:tweeps) do
      [
        Tweep.new(:uid => '123'),
        Tweep.new(:uid => '456')
      ]
    end

    let(:user) { User.new.tap{|u| u.tweeps = tweeps } }

    it "returns uid of all tweeps" do
      user.known_tweep_ids.should == ['123', '456']
    end
  end

  describe "#add_tweep" do
    let(:user) { User.new }
    let(:tweet_user) { {username: "Mike", name: "Mike", avatar: "http://gorilla.png", uid: "123"} }

    it "builds the tweep in the user's tweeps" do
      user.add_tweep(tweet_user)
      user.tweeps.first.username.should == "Mike"
    end
  end

end
