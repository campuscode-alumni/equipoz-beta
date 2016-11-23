FactoryGirl.define do
  factory :equipment do
    category
    serial_number "AGCBRA001"
    acquisition_date "2016-11-17 20:26:23"
    replacement_value 100.5
    usage_limit 10
    description "Makita 120v"
    available true
  end
end
