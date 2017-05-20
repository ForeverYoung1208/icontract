FactoryGirl.define do
  factory :akt do
    contract nil
    from_date "2017-05-20"
    sum "9.99"
    scan_path "MyString"
    doc_path "MyString"
    is_signed false
    is_deleted false
    is_taken_as_original false
  end
end
