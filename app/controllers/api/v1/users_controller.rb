class Api::V1::UsersController < ApplicationController
  # GET /api/v1/users
  def index
    @users = User.includes(posts: %i[comments author]).all.select(:id, :name,:photo, :email, :bio, :postsCounter)
    
    render json: @users
  end

  # GET /api/v1/users/:id
  def show
    @user = User.select(:id, :name,:photo, :email, :bio, :postsCounter).find(params[:id])
    render json: @user
  end

  # POST /api/v1/users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { status: :created, user: @user, notice: 'User was successfully created.', location: @user }
    else
      render json: { status: :unprocessable_entity, errors: @user.errors }
    end
  end

  # PATCH/PUT /api/v1/users/:id
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: { status: :ok, user: @user, notice: 'User was successfully updated.', location: @user }
    else
      render json: { status: :unprocessable_entity, errors: @user.errors }
    end
  end

  # DELETE /api/v1/users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: { status: :ok }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
