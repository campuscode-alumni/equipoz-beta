class RemoveTotalAmountFromContract < ActiveRecord::Migration[5.0]
  def change
    remove_column :contracts, :total_amount, :string
  end
end
