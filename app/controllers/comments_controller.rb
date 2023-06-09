class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new # needed to instantiate the form_for helper in the view
  end

  def create
    @post = current_user.posts.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to user_post_path(current_user.id, @post.id)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'Comment deleted successfully'
    redirect_to user_post_path(current_user.id, @comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id).merge(author_id: current_user.id)
  end
end
