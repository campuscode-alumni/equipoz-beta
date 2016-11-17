class Equipment < ApplicationRecord
  validates :category, 
            :serial_number,
            :acquisition_date,
            :replacement_value,
            :usage_limit,
            :description,
            presence: true
end
