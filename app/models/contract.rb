class Contract < ApplicationRecord
  has_one :delivery_receipt
  has_one :return_receipt
  belongs_to :customer
  has_many :rental_equipments
  has_many :equipment
  has_many :equipment, :through => :rental_equipments
  validates :customer, presence: true
end
