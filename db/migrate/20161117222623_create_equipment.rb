class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :category
      t.string :serial_number
      t.datetime :acquisition_date
      t.float :replacement_value
      t.integer :usage_limit
      t.text :description

      t.timestamps
    end
  end
end
