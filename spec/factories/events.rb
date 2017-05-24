FactoryGirl.define do
  factory :event do
    reminder nil
    user nil
    is_sent false
    to_send false
    email_address "MyString"
    email_text "MyText"
    on_date '01.01.2001'
  end
end
