class Api::V1::CommentsController < ApplicationController
  # GET /api/v1/posts/:post_id/comments
  def index
    @comments = Comment.includes(:author).all
    render json: @comments
  end

  # GET /api/v1/posts/:post_id/comments/:id
  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    render json: @comment
  end

  # POST /api/v1/posts/:post_id/comments
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      render json: { status: :created, comment: @comment, notice: 'Comment was successfully created.',
                     location: @comment }
    else
      render json: { status: :unprocessable_entity, errors: @comment.errors }
    end
  end

  # DELETE /api/v1/posts/:post_id/comments/:id
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    render json: { status: :ok }
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :author_id)
  end
end
