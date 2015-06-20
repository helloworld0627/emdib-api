class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :update, :destroy]

  # GET /bids
  # GET /bids.json
  def index
    @bids = Bid.all

    render json: @bids
  end

  # GET /bids/1
  # GET /bids/1.json
  def show
    render json: @bid
  end

  # POST /bids
  # POST /bids.json
  def create
    @bid = Bid.new(bid_params)

    if @bid.save
      render json: @bid, status: :created, location: @bid
    else
      render json: @bid.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bids/1
  # PATCH/PUT /bids/1.json
  def update
    @bid = Bid.find(params[:id])

    if @bid.update(bid_params)
      head :no_content
    else
      render json: @bid.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid.destroy

    head :no_content
  end

  private

    def set_bid
      @bid = Bid.find(params[:id])
    end

    def bid_params
      params.permit(:bid_price, :bid_status, :auction_id, :business_owner_id)
    end
end
