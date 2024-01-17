class BirthReg < ApplicationRecord
    belongs_to :user
    has_one :death_reg, dependent: :destroy
    has_many :death_regs
  end
  