class DeathRegsController < ApplicationController
  before_action :set_birth_reg, only: [:index, :create]
  before_action :set_death_reg, only: [:show]

  # GET /birth_regs/:birth_reg_id/death_regs
  def index
    @death_regs = @birth_reg.death_regs
    render json: @death_regs
  end

  # POST /birth_regs/:birth_reg_id/death_regs
  def create
    @death_reg = @birth_reg.death_regs.new(death_reg_params)

    if @death_reg.save
      render json: @death_reg, status: :created, location: birth_reg_death_reg_path(@birth_reg, @death_reg)
    else
      render json: @death_reg.errors, status: :unprocessable_entity
    end
  end

  # Other actions...

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
end
