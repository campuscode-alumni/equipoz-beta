class CreateCategoryAmounts < ActiveRecord::Migration[5.0]
  def change
    create_table :category_amounts do |t|
      t.references :category, foreign_key: true
      t.integer :rental_period
      t.float :amount

      t.timestamps
    end
  end
end
