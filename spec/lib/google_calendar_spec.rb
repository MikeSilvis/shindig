require 'spec_helper'
class RefreshGoogleToken
  def save_token
    true
  end
end
describe GoogleCalendar do
  before(:each) do
    GoogleCalendar.any_instance.stub(:get_new_token).and_return(true)
  end
  let(:google_data)  { JSON.parse(File.read("#{::Rails.root}/spec/fixtures/service_responses/google_response.json")) }
  let(:user) { FactoryGirl.create(:user) }
  let!(:authentication) { user.authentications.find_or_create_google(google_data) }
  let(:possible_time) { PossibleTime.new(event_id: 1, time_start: Time.new(2012, 07, 1), time_end: Time.new(2012, 07, 02)) }
  let(:g) { GoogleCalendar.new(user, possible_time)  }
  describe "#body" do
    it "returns an Hash" do
      g.body.should be_a(Hash)
    end
  end
  describe "#save_availability" do
    let(:available) { {"calendars"=>{"#{user.email}"=>{"busy"=>[]}}} }
    let(:busy) { {"calendars"=>{"#{user.email}"=>{"busy"=>[{[0]=>{"start"=>"2012-06-27T18:00:00Z", "end"=>"2012-06-27T21:00:00Z"}}]}}} }
    it "saves availability" do
      g.stub(:get_availability).and_return(available)
      g.save_availability
      user.possible_attendees.size.should == 1
    end
    it "DOESN'T saves availability" do
      g.stub(:get_availability).and_return(busy)
      g.save_availability
      user.possible_attendees.size.should == 0
    end
  end
end