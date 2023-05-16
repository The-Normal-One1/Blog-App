class UsersController < ApplicationController
  def index
    @users = User.includes(posts: %i[comments author]).all
  end

  def show
    @user = User.find(params[:id])
  end
end
