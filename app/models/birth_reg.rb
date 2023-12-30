class BirthReg < ApplicationRecord
    belongs_to :user
    has_one :death_reg, dependent: :destroy
  end
  