class Contract < ApplicationRecord
  has_one :delivery_receipt
  has_one :return_receipt
  belongs_to :customer
  has_many :rental_equipments
  has_many :equipment
  has_many :equipment, through: :rental_equipments
  validates :customer,
            :rental_period,
            :contact,
            :delivery_address,
            :payment_method,
            :equipment,
            :delivery_address, presence: true

  validate :available_equipment, on: :create

  def contract_code
    (created_at + id).to_i
  end

  def available_equipment
    message = 'Equipamentos em uso: '
    unavailable_equipment = Equipment.where(id: equipment_ids, available: false)

    unavailable_equipment.each do |equipment|
      message += "#{equipment.full_name}; "
    end

    errors.add(:equipment, message) unless unavailable_equipment.blank?
  end

  def amount
    RentalEquipment.where(equipment_id: equipment_ids).sum(:amount)
  end

  def total_amount
    amount - discount
  end
end
