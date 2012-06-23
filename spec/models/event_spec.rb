require 'spec_helper'

describe Event do
  let(:user1) { User.create(username: "mike" )}
  let(:event1) { Event.new(name: "Mike's Party", description: "Come Chill wit me") }
  let(:event2) { Event.new(name: "Mike's Party", description: "Rabble") }
  let(:event3) { Event.create(name: "Mike's Party", description: "Come Chill wit me", user_id: user1.id) }

  describe "#generate_token" do
    it "generates a unique token of different values" do
      event1.generate_token.should_not == event2.generate_token
    end
    it "generates a unique of similar values" do
      event1.generate_token.should_not == event3.generate_token
    end
  end
  describe "#find_from_token" do
    it "finds the event" do
      Event.find_from_token(event3.token).should be_a(Event)
    end
  end
  describe ".is_owner?" do
    it "returns true for owner" do
      event3.is_owner?(user1)
    end
  end
  describe ".best_time" do
    let!(:possible_time) { event3.possible_times << PossibleTime.create(time_start: Time.new(2012, 06, 01), time_end: Time.new(2012, 06, 02)) }
    it "sorts the possible times by the best" do
      event3.best_time.should be_a(PossibleTime)
    end
  end
end