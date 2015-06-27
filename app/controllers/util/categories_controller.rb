class Util::CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all

    render json: @categories
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    render json: @category
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end
end
