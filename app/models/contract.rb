class Contract < ApplicationRecord
  validates :customer, :equipment, presence: true

  has_one :delivery_receipt
end
