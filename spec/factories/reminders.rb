FactoryGirl.define do
  factory :reminder do
    reminder_type nil    
    reminderable nil
    dd "01"
    mm "01"
    yyyy "2017"
    dofw "1"
    moq "1"
    begins "2017-05-17"
    ends "2017-05-17"
    is_active true
  end
end
