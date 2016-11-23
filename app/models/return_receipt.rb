class ReturnReceipt < ApplicationRecord
  belongs_to :contract

  validates :employee, :document, presence: true 

end
