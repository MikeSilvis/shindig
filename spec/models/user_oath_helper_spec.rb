require 'spec_helper'

describe UserOathHelper do
  describe UserOathHelper::ClassMethods do
    describe "#verify_service" do
      context "for twitter" do
        let(:user_hash) {   { "name" => "Mike Silvis", "nickname" => "mikesilvis" } }
        let!(:user2) { User.new(username: "mikesilvis")}
        it "creates a twitter person" do
          User.verify_from_service("twitter", user_hash).should be_a(User)
        end
      end
    end
  end
end