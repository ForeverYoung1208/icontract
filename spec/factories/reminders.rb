FactoryGirl.define do
  factory :reminder do
    reminder_type nil    
    reminderable nil
    dd "01"
    mm "01"
    yyyy "2017"
    dofw "1"
    moq "1"
    begins "01.01.2017"
    ends "01.01.2018"
    is_active true
  end
end
