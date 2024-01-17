class DeathRegsController < ApplicationController
  before_action :set_user, only: [:index, :create]
  before_action :set_birth_reg, only: [:index, :create]
  before_action :set_death_reg, only: [:show]

  def index
    user = User.find(params[:user_id])
    @death_regs = user.death_regs
    respond_to do |format|
      format.json { render json: @death_regs }
    end
  end
  

  def create
    @death_reg = @birth_reg.death_regs.new(death_reg_params.merge(user_id: @user.id))  
    if @death_reg.save
      render json: @death_reg, status: :created, location: birth_reg_death_reg_path(@birth_reg, @death_reg)
    else
      render json: @death_reg.errors, status: :unprocessable_entity
    end
  end
  
  private

  def set_death_reg
    @death_reg = DeathReg.find(params[:id])
  end

  def death_reg_params
    params.require(:death_reg).permit(:cause_of_death, :place_of_death, :date_of_death, :certifying_doctor)
  end

  def set_birth_reg
    @birth_reg = BirthReg.find_by(id: params[:birth_reg_id])
    unless @birth_reg
      render json: { error: "Birth registration not found" }, status: :not_found
    end
  end
  
  def set_user
    @user = User.find(params[:user_id]) # This assumes user_id is passed in the request
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end
end
