class AddRefContractsToReturnReceipt < ActiveRecord::Migration[5.0]
  def change
    add_reference :return_receipts, :contract, foreign_key: true
  end
end
