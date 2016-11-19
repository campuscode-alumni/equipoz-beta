class Contract < ApplicationRecord
  belongs_to :customer
  has_many :rental_equipments
  has_many :equipment, :through => :rental_equipments
end
