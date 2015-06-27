class Util::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update]

  # GET /util/comments
  # GET /util/comments.json
  def index
    @comments = Comment.where(
      "auction_id = ? ",
      params[:auction_id])

    render json: @comments
  end

  # GET /util/comments/1
  # GET /util/comments/1.json
  def show
    render json: @comment
  end

  # POST /util/comments
  # POST /util/comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.auction_id = params[:auction_id]
    @comment.user = @user

    if @comment.save
      render json: @comment, status: :created,
             location: util_auction_comment_url({:id => @comment.id})
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /util/comments/1
  # PATCH/PUT /util/comments/1.json
  def update
    if @comment.update(comment_params)
      head :no_content
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

    def set_comment
      @comment = Comment.find_by({
        :id => params[:id],
        :auction_id => params[:auction_id]})
    end

    def comment_params
      params.permit(:content)
    end
end
