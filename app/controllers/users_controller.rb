class UsersController < ApplicationController

    before_action :set_user, only: [:show, :update, :destroy, :user_posts]

    def index
        users = User.order(:id)
        render json: users, status: :ok
    end

    def show
        if @user.blank?
          render json: { error: 'User not found' }, status: :not_found
        else
          render json: @user, status: :ok
        end
    end
    
    def create
        byebug
        user = User.new(user_params)
        if user.save
            render json: user, status: :created
        else
            render json: { error: user.errors }, status: :unprocessable_entity
        end

    end

    def user_posts
        posts = @user&.posts
        render json: posts, status: :ok
    end

    def update
        if @user.update(user_params)
            render json: @user, status: :ok
        else
            render json: { error: @user.errors }, status: :unprocessable_entity
        end
    end

    def destroy
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email)
    end

    

end