class AddUserIdToBirthRegs < ActiveRecord::Migration[6.0]
  def change
    add_reference :birth_regs, :user, null: false, foreign_key: true
  end
end
