class Buyer::AuctionsController < ApplicationController
  # GET /business/auctions
  # GET /business/auctions.json
  def index
    auctions = Auction.joins('INNER JOIN bids ON bids.auction_id = auctions.id')
                      .where("buyer_id = ?", @user.id)
                      .distinct(:id)
    render json: auctions
  end
end