class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(posts: %i[comments author]).find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_post_path(current_user.id, @post.id)
    else
      render :new
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash[:success] = 'Post was deleted successfully.'
    redirect_to user_posts_path(current_user.id, @post.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).merge(author_id: current_user.id, commentsCounter: 0, likesCounter: 0)
  end
end
