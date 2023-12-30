class CreateBirthRegs < ActiveRecord::Migration[7.1]
  def change
    create_table :birth_regs do |t|
      t.string :father_first_name
      t.string :father_last_name
      t.string :mother_first_name
      t.string :mother_last_name
      t.string :child_first_name
      t.string :child_last_name
      t.string :place_of_birth
      t.string :sex
      t.text :address_at_time_of_birth
      t.string :district
      t.text :permanent_address

      t.timestamps
    end
  end
end
