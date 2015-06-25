class Customer::AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :update]

  # GET /auctions
  # GET /auctions.json
  def index
    user_id = @user.id
    @auctions = Auction.where("seller_id = ?", user_id)

    # get all belong auctions
    render json: @auctions
  end

  # GET /auctions/1
  # GET /auctions/1.json
  def show
    render json: @auction
  end

  # POST /auctions
  # POST /auctions.json
  def create
    @auction = Auction.new(auction_params)
    @auction.seller = @user

    if @auction.save
      render json: @auction, status: :created, location: customer_auction_url(@auction)
    else
      render json: @auction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /auctions/1
  # PATCH/PUT /auctions/1.json
  def update
    if @auction.update(auction_params)
      head :no_content
    else
      render json: @auction.errors, status: :unprocessable_entity
    end
  end

  private
    # get belonging auction 
    def set_auction
      @auction = Auction.find_by(
        {:seller => @user, :id => params[:id]})
      
      render json: nil, status: :not_found if @auction.nil?
    end

    def auction_params
      params.permit(:auction_title, 
                    :auction_desc,
                    :auction_status,
                    :auction_start_price,
                    :auction_end_price,
                    :auction_start_date,
                    :auction_end_date,
                    :category_id,
                    :longtitude,
                    :latitude)
    end
end
