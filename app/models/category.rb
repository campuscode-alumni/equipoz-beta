class Category < ApplicationRecord
  has_many :category_amounts
  
  validates :name, presence: true, uniqueness: true
end
