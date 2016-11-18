class CreateReturnReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :return_receipts do |t|
      t.string :employee
      t.string :document

      t.timestamps
    end
  end
end
