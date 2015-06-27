class Util::CommentsController < ApplicationController
  before_action :set_util_comment, only: [:show, :update, :destroy]

  # GET /util/comments
  # GET /util/comments.json
  def index
    @util_comments = Util::Comment.all

    render json: @util_comments
  end

  # GET /util/comments/1
  # GET /util/comments/1.json
  def show
    render json: @util_comment
  end

  # POST /util/comments
  # POST /util/comments.json
  def create
    @util_comment = Util::Comment.new(util_comment_params)

    if @util_comment.save
      render json: @util_comment, status: :created, location: @util_comment
    else
      render json: @util_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /util/comments/1
  # PATCH/PUT /util/comments/1.json
  def update
    @util_comment = Util::Comment.find(params[:id])

    if @util_comment.update(util_comment_params)
      head :no_content
    else
      render json: @util_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /util/comments/1
  # DELETE /util/comments/1.json
  def destroy
    @util_comment.destroy

    head :no_content
  end

  private

    def set_util_comment
      @util_comment = Util::Comment.find(params[:id])
    end

    def util_comment_params
      params[:util_comment]
    end
end
