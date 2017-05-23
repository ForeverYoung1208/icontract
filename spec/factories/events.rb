FactoryGirl.define do
  factory :event do
    reminder nil
    user nil
    is_sent false
    to_send false
    email_address "MyString"
    email_text "MyText"
  end
end
