class BusinessOwnersController < ApplicationController
  before_action :set_business_owner, only: [:show, :update, :destroy]

  # GET /business_owners
  # GET /business_owners.json
  def index
    @business_owners = BusinessOwner.all

    render json: @business_owners
  end

  # GET /business_owners/1
  # GET /business_owners/1.json
  def show
    render json: @business_owner
  end

  # POST /business_owners
  # POST /business_owners.json
  def create
    @business_owner = BusinessOwner.new(business_owner_params)

    if @business_owner.save
      render json: @business_owner, status: :created, location: @business_owner
    else
      render json: @business_owner.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /business_owners/1
  # PATCH/PUT /business_owners/1.json
  def update
    @business_owner = BusinessOwner.find(params[:id])

    if @business_owner.update(business_owner_params)
      head :no_content
    else
      render json: @business_owner.errors, status: :unprocessable_entity
    end
  end

  # DELETE /business_owners/1
  # DELETE /business_owners/1.json
  def destroy
    @business_owner.destroy

    head :no_content
  end

  private

    def set_business_owner
      @business_owner = BusinessOwner.find(params[:id])
    end

    def business_owner_params
      params.permit(:client_id, :yelp_url)
    end
end
