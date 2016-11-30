class RemoveAmountFromContract < ActiveRecord::Migration[5.0]
  def change
    remove_column :contracts, :amount, :string
  end
end
