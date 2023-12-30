class CreateDeathRegs < ActiveRecord::Migration[7.1]
  def change
    create_table :death_regs do |t|
      t.references :birth_reg, null: false, foreign_key: true
      t.string :father_first_name
      t.string :father_last_name
      t.string :mother_first_name
      t.string :mother_last_name
      t.string :deceased_first_name
      t.string :deceased_last_name
      t.string :place_of_death
      t.string :place_of_birth
      t.string :sex
      t.text :address_at_time_of_death
      t.text :permanent_address
      t.string :local_area

      t.timestamps
    end
  end
end
