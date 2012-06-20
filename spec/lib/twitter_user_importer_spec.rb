require 'spec_helper'

describe TwitterUserImporter do
  let(:user){ User.new }
  describe "#initialize" do
    it "takes a user" do
      TwitterUserImporter.new(user)
    end
  end

  describe "#get_tweeps" do
    let(:importer) { TwitterUserImporter.new(user)}
    it "gets a user's tweeps" do
      api.should_receive(:tweep_ids)
      api.should_receive
      importer.get_tweeps
    end
  end
end