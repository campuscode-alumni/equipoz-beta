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

  def amount
    total = 0
    equipment.each do |equipment|
      period_amount = equipment.category_amounts.where(rental_period: rental_period).last
      if period_amount
         total += period_amount.amount
      end
    end
    total
  end

  def total_amount
    amount - discount
  end
end
