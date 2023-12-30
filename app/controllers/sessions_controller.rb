class SessionsController < ApplicationController
    # GET /login
    def new
    end
  
    # POST /login
    def create
      user = User.find_by(username: params[:username])
      
      # Authenticate user
      if user&.authenticate(params[:password])
        # You can use the `session` or a token-based approach like JWT for APIs
        session[:user_id] = user.id
        render json: { status: :created, logged_in: true, user: user }
      else
        render json: { status: 401, message: "Invalid credentials" }, status: :unauthorized
      end
    end
  
    # DELETE /logout
    def destroy
      # If using session-based authentication:
      session[:user_id] = nil
      
      # If using token-based authentication such as JWT, you'd handle token revocation here.
  
      render json: { status: :ok, logged_in: false }
    end
  
    private
  
    # If you're using strong parameters (for example, with an API)
    def session_params
      params.require(:session).permit(:username, :password)
    end
  end
  