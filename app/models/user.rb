class User < ApplicationRecord
    has_secure_password
    has_many :birth_regs
    has_many :death_regs, through: :birth_regs
  end
  