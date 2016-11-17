class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :legal_name
      t.string :customer_type
      t.string :document
      t.string :fiscal_number
      t.string :contact_name
      t.string :phone_number
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
