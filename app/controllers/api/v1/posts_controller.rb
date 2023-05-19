class Api::V1::PostsController < ApplicationController

    # GET /api/v1/posts
    def index
        @posts = Post.includes(:author, :comments, :likes).all
        render json: @posts
    end
    
    # GET /api/v1/posts/:id
    def show
        @post = Post.find(params[:id])
        render json: @post
    end
    
    # POST /api/v1/posts
    def create
        @post = Post.new(post_params)
        if @post.save
        render json: { status: :created, post: @post, notice: 'Post was successfully created.', location: @post }
        else
        render json: { status: :unprocessable_entity, errors: @post.errors }
        end
    end

    # PATCH/PUT /api/v1/posts/:id
    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
        render json: { status: :ok, post: @post, notice: 'Post was successfully updated.', location: @post }
        else
        render json: { status: :unprocessable_entity, errors: @post.errors }
        end

    end
    
    # DELETE /api/v1/posts/:id
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        render json: { status: :ok }
    end
    
    private
    
    def post_params
        params.require(:post).permit(:title, :body, :author_id)
    end

end
