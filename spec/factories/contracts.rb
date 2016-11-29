FactoryGirl.define do
  factory :contract do
    customer
    rental_period 30
    delivery_address 'Av. Paulista, n-55, cep 122222'
    contact 'Joao'
    payment_method 'a vista'
    discount 100.0
    equipment { create_list(:equipment, 2) }
  end
end
