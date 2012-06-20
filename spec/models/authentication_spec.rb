require 'spec_helper'

describe Authentication do
  let(:twitter_data) { JSON.parse(File.read("#{::Rails.root}/spec/fixtures/service_responses/twitter_response.json")) }
  let(:google_data)  { JSON.parse(File.read("#{::Rails.root}/spec/fixtures/service_responses/google_response.json")) }
  let(:twitter1)     { User.verify_twitter(twitter_data) }
  let(:twitter2)     { User.verify_twitter(twitter_data) }
  let(:google1)      { twitter1.user.authentications.find_or_create_google(google_data)   }
  let(:google2)      { twitter2.user.authentications.find_or_create_google(google_data)   }

  let(:google3)      { User.verify_google(google_data) }
  let(:twitter3)     { google3.user.authentications.find_or_create_twitter(twitter_data) }

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

  describe "Create account from Twitter" do
    it "Twitter account and Google account are the same" do
      google1.user.id.should == twitter1.user.id
      google1.user.id.should == google2.user.id
    end
  end

  describe "Create account from Google" do
    it "Google account and twitter account are the same" do
      twitter3.user.id.should == google3.user.id
    end
  end

  describe "From User find auths" do
    it "Can find Twitter" do
      twitter3.user.twitter.id.should == twitter3.id
    end
    it "Can find Google" do
      google3.user.google.id.should == google3.id
    end
  end

end