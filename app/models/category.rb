class Category < ApplicationRecord
  has_many :category_amounts, inverse_of: :category
  accepts_nested_attributes_for :category_amounts

  validates :name, presence: true, uniqueness: true

  def self.periods
    [1, 3, 5, 7, 15, 20, 30]
  end
end
