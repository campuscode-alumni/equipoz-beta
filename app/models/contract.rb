class Contract < ApplicationRecord
  belongs_to :customer
  validates :equipment, presence: true
end
