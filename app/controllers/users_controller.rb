class UsersController < ApplicationController
    before_action :set_user, only: [:show]
  
    # GET /users/new (Sign Up)
    def new
      @user = User.new
    end
  
    def index
      @users = User.all
      render json: @users
    end
  
      # If you're using this for HTML response:
      # respond_to do |format|
      #   format.html # index.html.erb
      #   format.json { render json: @users }

   # POST /users (User Registration)
   def create
    if @user
      @birth_reg = @user.birth_regs.build(birth_reg_params)
  
      if @birth_reg.save
        render json: @birth_reg, status: :created, location: user_birth_reg_path(@user, @birth_reg)
      else
        render json: @birth_reg.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

    # GET /users/1 (Profile Page - Optional)
    def show
      if @user
        render json: @user
      else
        render json: { error: "User not found" }, status: :not_found
      end
    end
    
    # Other actions like edit, update, and destroy can be added as needed.
  
    private
  
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find_by(id: params[:id])
        unless @user
          render json: { error: "User not found" }, status: :not_found
        end
      end
      
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
      end
  end
  