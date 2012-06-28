require 'spec_helper'

describe User do
  let(:user) { User.new(username: "Weee", email: "mikesilvis@gmail.com") }
  describe "#known_tweep_ids" do
    let(:tweeps) do
      [ Tweep.new(:uid => 123), Tweep.new(:uid => 456) ]
    end

    let(:user_tweeps) { User.new.tap{|u| u.tweeps = tweeps } }

    it "returns uid of all tweeps" do
      user_tweeps.known_tweep_ids.should == [123, 456]
    end
  end

  describe "#add_tweep" do
    let(:tweet_user) { {username: "Mike", name: "Mike", avatar: "http://gorilla.png", uid: "123"} }

    it "builds the tweep in the user's tweeps" do
      user.add_tweep(tweet_user)
      user.tweeps.first.username.should == "Mike"
    end
  end
  describe "#add_tweep!" do
    let(:tweet_user) { {username: "Mike", name: "Mike", avatar: "http://gorilla.png", uid: "123"} }
    it "saves the tweep" do
      user.add_tweep!(tweet_user).should be_true
    end
  end
  describe "#imported_google?" do
    it "returns false" do
      user.imported_google?.should == false
    end
    it "returns true after google account" do
      user.authentications << Authentication.create(provider: "google")
      user.imported_google?.should == true
    end
  end
  describe "#find_user_and_event_relations(user_id, event_id)" do
    let(:event) { Event.create(name: "WA", description: "ZAP")}
    let(:attendee) { Attendee.new(event_id: event.id) }
    before(:each) do
      user.attendees << attendee
    end
    describe "#current_attendee(event_id)" do
      it "returns the current attendee for a given room" do
        user.current_attendee(event.id).should be_a(Attendee)
      end
    end
    it "returns a user relation" do
      user.save
      User.find_user_and_event_relations(user.id, event.id)
    end
  end
end
