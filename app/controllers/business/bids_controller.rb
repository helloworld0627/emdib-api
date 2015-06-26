class Business::BidsController < ApplicationController
  before_action :set_business_bid, only: [:show, :update, :destroy]

  # GET /business/bids
  # GET /business/bids.json
  def index
    @business_bids = Business::Bid.all

    render json: @business_bids
  end

  # GET /business/bids/1
  # GET /business/bids/1.json
  def show
    render json: @business_bid
  end

  # POST /business/bids
  # POST /business/bids.json
  def create
    @business_bid = Business::Bid.new(business_bid_params)

    if @business_bid.save
      render json: @business_bid, status: :created, location: @business_bid
    else
      render json: @business_bid.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /business/bids/1
  # PATCH/PUT /business/bids/1.json
  def update
    @business_bid = Business::Bid.find(params[:id])

    if @business_bid.update(business_bid_params)
      head :no_content
    else
      render json: @business_bid.errors, status: :unprocessable_entity
    end
  end

  # DELETE /business/bids/1
  # DELETE /business/bids/1.json
  def destroy
    @business_bid.destroy

    head :no_content
  end

  private

    def set_business_bid
      @business_bid = Business::Bid.find(params[:id])
    end

    def business_bid_params
      params[:business_bid]
    end
end
