FactoryGirl.define do
  factory :contract do
    customer
    rental_period 30
    delivery_address "Av. Paulista, n-55, cep 122222"
    contact "Joao"
    payment_method "a vista"
    amount 1000.5
    discount 100.0
    total_amount 900.5
    equipment { create_list(:equipment, 1)}
  end
end
