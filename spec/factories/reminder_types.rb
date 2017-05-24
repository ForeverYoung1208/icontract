FactoryGirl.define do
  factory :reminder_type do
    sequence (:name) { |i| "reminder_type_name#{i}"}
    description 'Evokes event every given day'  	
  end
end
