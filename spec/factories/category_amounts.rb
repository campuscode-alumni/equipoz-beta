FactoryGirl.define do
  factory :category_amount do
    category
    rental_period 30
    amount 1.5
  end
end
