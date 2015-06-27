class Business::BidsController < ApplicationController
  before_action :set_bid, only: [:show, :update]

  # GET /business/bids
  # GET /business/bids.json
  def index
    user_id = @user.id
    @bids = Bid.where("business_owner_id = ? and auction_id = ?", 
                      user_id, params[:auction_id])
    render json: @bids
  end

  # GET /business/bids/1
  # GET /business/bids/1.json
  def show
    render json: @bid
  end

  # POST /business/bids
  # POST /business/bids.json
  def create
    @bid = Bid.new(bid_params)
    @bid.business_owner_id = @user.id
    @bid.bid_status = :non_progess

    auction = Auction.find(params[:auction_id])
    @bid.auction = auction

    if @bid.save
      render json: @bid, status: :created,
       location: business_auction_bid_url({:auction_id => auction.id, :id => @bid.id})
    else
      render json: @bid.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /business/bids/1
  # PATCH/PUT /business/bids/1.json
  def update
    if @bid.update(bid_params)
      head :no_content
    else
      render json: @bid.errors, status: :unprocessable_entity
    end
  end

  private

    def set_bid
      @bid = Bid.find_by({
        :id => params[:id],
        :auction_id => params[:auction_id],
        :business_owner_id => @user.id})

      render json: nil, status: :not_found if @bid.nil?
    end

    def bid_params
      params.permit(:bid_price, :bid_status)
    end
end