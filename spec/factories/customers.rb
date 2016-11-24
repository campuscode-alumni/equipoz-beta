FactoryGirl.define do
  factory :customer do
    name 'Odebreach'
    legal_name 'Industria Construtora'
    customer_type 'Juridico'
    document '00444555000121'
    fiscal_number '10101010'
    contact_name 'João'
    phone_number '1155443322'
    email 'sac@lavajato.gov.br'
    address 'Rua da Pamplona 100'
  end
end
