class Equipment < ApplicationRecord
  validates :category,
            :serial_number,
            :acquisition_date,
            :replacement_value,
            :usage_limit,
            :description,
            presence: true

  has_many :rental_equipments
  has_many :contracts, through: :rental_equipments
  belongs_to :category
  has_many :category_amounts, through: :category

  def full_name
    "##{serial_number} - #{category.name}: #{description}"
  end
end
