class Customer::AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :update, :destroy]

  # GET /auctions
  # GET /auctions.json
  def index
    user_id = @user.id
    @auctions = Auction.where("seller_id = ?", user_id)

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
      render json: @auction, status: :created, location: @auction
    else
      render json: @auction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /auctions/1
  # PATCH/PUT /auctions/1.json
  def update
    #@auction = Auction.find(params[:id])

    if @auction.update(auction_params)
      head :no_content
    else
      render json: @auction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /auctions/1
  # DELETE /auctions/1.json
  def destroy
    @auction.destroy
    head :no_content
  end

  private

    def set_auction
      user_id = @user.id
      @auction = Auction.find_by(
        {:seller => user_id, :id => params[:id]})
      
      render json: nil, status: :not_found if @auction == nil
    end

    def auction_params
      params.permit(:auction_title, 
                    :auction_desc,
                    :auction_status,
                    :auction_start_price,
                    :auction_end_price,
                    :auction_start_date,
                    :auction_end_date,
                    :service_loc,
                    :service_loc_type,
                    :seller_contact)
    end
end
