require 'spec_helper'

describe TwitterUserFetcher do

  describe "#fetch" do
    context "when there are no blacklisted ids" do
      let(:fetcher) { TwitterUserFetcher.new(api) }
      let(:api)     { TwitterApi.new('token', 'secret') }

      it "gets tweeps for each id" do
        api.should_receive(:tweep_ids).once.and_return([123, 456])
        api.should_receive(:get_users).once.with([123, 456])
        fetcher.fetch
      end
    end

    context "when there are some blacklisted ids" do
      let(:fetcher) { TwitterUserFetcher.new(api, [123])}
      let(:api)     { TwitterApi.new('token', 'secret') }

      it "gets tweeps for each non-blacklisted id" do
        api.should_receive(:tweep_ids).once.and_return([123, 456])
        api.should_receive(:get_users).once.with([456])
        fetcher.fetch
      end
    end

    context "when all ids are blacklisted" do
      let(:fetcher) { TwitterUserFetcher.new(api, [123, 456])}
      let(:api)     { TwitterApi.new('token', 'secret') }

      it "does not get tweeps" do
        api.should_receive(:tweep_ids).once.and_return([123, 456])
        api.should_receive(:get_users).never
        fetcher.fetch
      end

      it "returns an empty collection" do
        api.stub(:tweep_ids => [123, 456])
        fetcher.fetch.should be_empty
      end
    end
  end
end

