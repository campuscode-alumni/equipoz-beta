class Equipment < ApplicationRecord
  validates :category,
            :serial_number,
            :acquisition_date,
            :replacement_value,
            :usage_limit,
            :description,
            presence: true

  has_many :rental_equipments
  has_many :contracts, :through => :rental_equipments
end
