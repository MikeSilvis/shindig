require 'spec_helper'

describe Authentication do

  describe "#add_twitter" do
    let(:data) { JSON.parse(File.read("#{::Rails.root}/spec/fixtures/service_responses/twitter_response.json")) }
    it "Creates a user & twitter details" do
      user = Authentication.add_twitter(data)
      user.username.should == "mikesilvis"
      user.twitter.username.should == "mikesilvis"
    end
    it "only adds the account once" do

    end
  end

end