class Contract < ApplicationRecord
  has_one :delivery_receipt
  belongs_to :customer
  
  validates :customer, :equipment, presence: true
  validates :equipment, presence: true
end
