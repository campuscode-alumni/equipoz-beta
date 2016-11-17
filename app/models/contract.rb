class Contract < ApplicationRecord
  validates :customer, :equipment, presence: true
end
