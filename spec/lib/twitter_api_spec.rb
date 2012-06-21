require 'spec_helper'

describe TwitterApi do
  let(:api)  { TwitterApi.new('', '', test_client) }
  let(:test_client) { double }

  describe "#tweep_ids" do
    before do
      test_client.stub_chain(:friend_ids,   :ids => [123, 456])
      test_client.stub_chain(:follower_ids, :ids => [456, 789])
    end

    it "returns the intersection of friend ids and follower ids" do
      api.tweep_ids.should == [456]
    end
  end

end
