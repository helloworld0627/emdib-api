require 'rails_helper'

RSpec.describe Bid, :type => :model do
  before(:each) do
  	@existing_bid = FactoryGirl.create(:bid)
  end

  context ".save" do
  	it "saves a valid bid" do
  		new_bid = FactoryGirl.build(:bid)
  		expect(new_bid.save).to be true
  	end

    it "saves a invalid bid with wrong prices" do
		new_bid = FactoryGirl.build(:bid, :bid_price => -10)
		expect(new_bid.save).to be false
	end

    it "saves a invalid bid with nil business owner" do
		new_bid = FactoryGirl.build(:bid, :business_owner => nil)
		expect(new_bid.save).to be false
	end

	it "saves a invalid bid with nil auction" do
		new_bid = FactoryGirl.build(:bid, :auction => nil)
		expect(new_bid.save).to be false
	end
  end

  context ".find_by_auction_id" do
  	it "finds existing bid" do
  		auction = @existing_bid.auction
  		found = Bid.find_by_auction_id(auction)
  		expect(found).to eql(@existing_bid)
    end

    it "finds non-existing bid" do
  		found = Bid.find_by_auction_id(-1)
  		expect(found).to eql(nil)
    end
  end

  context ".find_by_business_owner_id" do
  	it "finds existing bid" do
  		business_owner = @existing_bid.business_owner
  		found = Bid.find_by_business_owner_id(business_owner)
  		expect(found).to eql(@existing_bid)
    end

    it "finds non-existing bid" do
  		found = Bid.find_by_business_owner_id(-1)
  		expect(found).to eql(nil)
    end
  end
end
