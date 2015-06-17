require 'rails_helper'

RSpec.describe Auction, :type => :model do
	before(:each) do
		@existing_auction = FactoryGirl.create(:auction)
	end

	context ".save" do
		it "saves a valid auction" do
			new_auction = FactoryGirl.build(:auction)
			expect(new_auction.save).to be true
		end

		#it "saves an invalid auction with wrong dates" do
		#	new_auction = FactoryGirl.build(
		#		:auction,
		#		:auction_start_date => DateTime.new(2015, 6, 2),
		#		:auction_end_date => DateTime.new(2015, 6, 1)
		#		)
		#	expect(new_auction.save).to be false
		#end

		it "saves an invalid auction with wrong prices" do
			new_auction = FactoryGirl.build(:auction, :auction_start_price => 10, :auction_end_price => 5)
			expect(new_auction.save).to be false

			new_auction = FactoryGirl.build(:auction, :auction_start_price => -10)
			expect(new_auction.save).to be false
		end

		it "saves an invalid auction with empty title" do
			new_auction = FactoryGirl.build(:auction, :auction_title => "")
			expect(new_auction.save).to be false
		end

		it "saves an invalid auction with nil title" do
			new_auction = FactoryGirl.build(:auction, :auction_title => nil)
			expect(new_auction.save).to be false
		end
	end

	context ".find_by_seller_id" do
		it "find auctions with given user" do
			seller = @existing_auction.seller
			found = Auction.find_by_seller_id(seller)
			expect(found).to eql(@existing_auction)
		end

		it "find non-existing auctions" do
			found = Auction.find_by_seller_id(-1)
			expect(found).to eql(nil)
		end
	end
end
