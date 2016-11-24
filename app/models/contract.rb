class Contract < ApplicationRecord
  has_one :delivery_receipt
  has_one :return_receipt
  belongs_to :customer
  has_many :rental_equipments
  has_many :equipment
  has_many :equipment, through: :rental_equipments
  validates :customer,
            :equipment,
            :rental_period,
            :contact,
            :delivery_address,
            :payment_method,
            :delivery_address, presence: true

  def contract_code
    (created_at + id).to_i
  end
end
