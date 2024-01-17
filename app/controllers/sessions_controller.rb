class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(username: params[:username])
      
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: { status: :created, logged_in: true, user: user }
      else
        render json: { status: 401, message: "Invalid credentials" }, status: :unauthorized
      end
    end
  
    def destroy
      session[:user_id] = nil  
      render json: { status: :ok, logged_in: false }
    end
  
    private
  
    def session_params
      params.require(:session).permit(:username, :password)
    end
  end
  