class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.string :customer
      t.string :equipment
      t.integer :rental_period
      t.string :delivery_address
      t.string :contact
      t.string :payment_method
      t.float :amount
      t.float :discount
      t.float :total_amount

      t.timestamps
    end
  end
end
