class Business::AuctionsController < ApplicationController
  before_action :set_business_auction, only: [:show, :update, :destroy]

  # GET /business/auctions
  # GET /business/auctions.json
  def index
    @business_auctions = Business::Auction.all

    render json: @business_auctions
  end

  # GET /business/auctions/1
  # GET /business/auctions/1.json
  def show
    render json: @business_auction
  end

  # POST /business/auctions
  # POST /business/auctions.json
  def create
    @business_auction = Business::Auction.new(business_auction_params)

    if @business_auction.save
      render json: @business_auction, status: :created, location: @business_auction
    else
      render json: @business_auction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /business/auctions/1
  # PATCH/PUT /business/auctions/1.json
  def update
    @business_auction = Business::Auction.find(params[:id])

    if @business_auction.update(business_auction_params)
      head :no_content
    else
      render json: @business_auction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /business/auctions/1
  # DELETE /business/auctions/1.json
  def destroy
    @business_auction.destroy

    head :no_content
  end

  private

    def set_business_auction
      @business_auction = Business::Auction.find(params[:id])
    end

    def business_auction_params
      params[:business_auction]
    end
end
