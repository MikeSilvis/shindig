require 'spec_helper'

describe Authentication do
  let(:twitter_data) { JSON.parse(File.read("#{::Rails.root}/spec/fixtures/service_responses/twitter_response.json")) }
  let(:google_data)  { JSON.parse(File.read("#{::Rails.root}/spec/fixtures/service_responses/google_response.json")) }
  let(:google1)      { User.verify_google(google_data)   }
  let(:google2)      { User.verify_google(google_data)   }
  let(:twitter1)     { User.verify_twitter(twitter_data) }
  let(:twitter2)     { User.verify_twitter(twitter_data) }

  describe "#verify_twitter" do
    it "Creates a user & twitter details" do
      twitter1.username.should == "mikesilvis"
      twitter1.user.username.should == "mikesilvis"
    end
    it "only adds the account once" do
      twitter1.id.should == twitter2.id
      twitter1.user.id.should == twitter2.user.id
    end
  end

  # describe "#verify_google" do
  #   it "Twitter account and Google account are the same" do
  #     # twitter1.id.should == google1.id
  #     google1
  #   end
  # end

end