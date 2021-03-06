FactoryGirl.define do
  factory :contract do 
    name 'contract1'
    number 'number1'
    sum '11.22'
    from_date '06.05.2017'
    to_date '10.05.2017'
    till 'cpecified date'
    is_signed true
    is_active true
    is_deleted false
    preferences 'none'   

  end

  factory :company do
    name "company_name"
    address "company_address"
    sequence (:edrpou) { |i| "9876543#{i}"}
  end

  factory :type do
    name "type_name"
    typical_contract_name "typical_contract_name"
  end


end