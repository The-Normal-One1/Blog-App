class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end
 
  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end
  
  def create
  @user = User.find(params[:user_id])
    #using the current_user method from ApplicationController
  @post = @user.posts.new(post_params)
  if @post.save
    redirect_to user_post_path(@user.id, @post.id)
  else
    render :new
  end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text).merge(author_id: current_user.id, commentsCounter: 0, likesCounter: 0)
  end
end
