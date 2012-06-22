require 'spec_helper'

describe Event do
  describe "#generate_token" do
    let(:event1) { Event.new(name: "Mike's Party", description: "Come Chill wit me") }
    let(:event2) { Event.new(name: "Mike's Party", description: "Rabble") }
    let(:event3) { Event.new(name: "Mike's Party", description: "Come Chill wit me") }
    it "generates a unique token of different values" do
      event1.generate_token.should_not == event2.generate_token
    end
    it "generates a unique of similar values" do
      event1.generate_token.should_not == event3.generate_token
    end
  end
end