class AddAmountToRentalEquipment < ActiveRecord::Migration[5.0]
  def change
    add_column :rental_equipments, :amount, :integer
  end
end
