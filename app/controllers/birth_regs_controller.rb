class BirthRegsController < ApplicationController
  before_action :set_user, only: [:index, :create]
  before_action :set_birth_reg, only: [:show, :edit, :update, :destroy]

  def index
    @birth_regs = @user.birth_regs
    render json: @birth_regs
  end
  
  
  def create
    @birth_reg = @user.birth_regs.new(birth_reg_params)
    if @birth_reg.save
      render json: @birth_reg, status: :created, location: user_birth_reg_path(@user, @birth_reg)
    else
      render json: @birth_reg.errors, status: :unprocessable_entity
    end
  end

  private

  def set_birth_reg 
    @birth_reg = BirthReg.find(params[:id])
  end

  def birth_reg_params
    params.require(:birth_reg).permit(:father_first_name, :father_last_name, :mother_first_name, :mother_last_name, :child_first_name, :child_last_name, :place_of_birth, :sex, :address_at_time_of_birth, :district, :permanent_address)
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
    unless @user
      render json: { error: "User not found" }, status: :not_found
    end
  end
end
