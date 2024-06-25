class PostsController < ApplicationController
    before_action :set_user, only: :create
    before_action :set_post, only: [:show, :update, :destroy]

    def index
        posts = Post.order(:id)
        render json: posts, status: :ok
    end

    def create
        post = @user.posts.create!(post_params)
        if post.save
            render json: post, status: :ok
        else
            render json: { error: post.errors }, status: :unprocessable_entity
        end
    end

    def show
        if @post.blank?
            render json: { error: 'Post not found' }, status: :not_found
          else
            render json: @post, status: :ok
          end
    end

    def update
        if @post.update(post_params)
            render json: @post, status: :ok
        else 
            render json: {error: @post.errors}, status: :unprocessable_entity
        end
    end

    def destroy
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :body, :description, :favorites_count, :user_id)
    end
    
end