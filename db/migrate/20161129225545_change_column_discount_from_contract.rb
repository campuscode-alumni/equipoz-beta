class ChangeColumnDiscountFromContract < ActiveRecord::Migration[5.0]
  def change
    change_column_default :contracts, :discount, from: nil, to: 0
  end
end
