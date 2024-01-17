class UsersController < ApplicationController
    before_action :set_user, only: [:show]
  
    def new
      @user = User.new
    end
  
    def index
      @users = User.all
      render json: @users
    end

    def create
      logger.debug "Received params: #{params.inspect}"
      @user = User.new(user_params) 
  
      if @user.save
        render json: @user, status: :created 
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity 
      end
    end

    def show
      if @user
        render json: @user
      else
        render json: { error: "User not found" }, status: :not_found
      end
    end
    
  
    private
  
      def set_user
        @user = User.find_by(id: params[:id])
        unless @user
          render json: { error: "User not found" }, status: :not_found
        end
      end
      
      def user_params
        params.require(:user).permit(:username, :email, :password)
      end
      
      
  end
  