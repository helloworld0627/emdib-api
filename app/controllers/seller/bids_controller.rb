class Seller::BidsController < ApplicationController
  before_action :set_bid, only: [:show, :update]

  # GET /bids
  # GET /bids.json
  def index
    @bids = Bid.where("auction_id = ?", params[:auction_id])

    render json: @bids
  end

  # GET /bids/1
  # GET /bids/1.json
  def show
    render json: @bid
  end

  # PATCH/PUT /bids/1
  # PATCH/PUT /bids/1.json
  def update
    if @bid.update(bid_params)
      head :no_content
    else
      render json: @bid.errors, status: :unprocessable_entity
    end
  end

  private
    # get bid belonging to auction
    def set_bid
      @bid = Bid.find_by({
        :id => params[:id],
        :auction_id => params[:auction_id]})

      render json: nil, status: :not_found if @bid.nil? || @bid.auction.seller.id != @user.id
    end

    def bid_params
      params.permit(:bid_status)
    end
end
