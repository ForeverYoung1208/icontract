FactoryGirl.define do
  factory :reminder do
    reminder_type nil    
    reminderable nil
    dd "99"
    mm "99"
    yyyy "9999"
    dofw "9"
    moq "9"
    begins "2017-05-17"
    ends "2017-05-17"
    is_active false
  end
end
