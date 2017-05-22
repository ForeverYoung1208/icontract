# require 'rails_helper'

# RSpec.describe "akts/edit", type: :view do
#   before(:each) do
#     @contract = Contract.new(
#       name: 'contract1',
#       number: '№1234',
#       sum: '99999999.99',
#       from_date: '20.04.2017',
#       to_date: '20.05.2017',
#       till: 'выполнения сторонами обязательств',
#       is_signed: true,
#       is_active: true,
#       is_deleted: false,
#       acts_schedule: 'schedule1',
#       payments_schedule: 'schedule1',
#       scan_path: '/contracts/scan/',
#       text_path: '/contracts/docs/',
#       type_id: 1,
#       payer_id: 1,
#       recipient_id: 1,
#       responsible_user_id: 1,
#       responsible_user_name: 'User1',
#       creator_user_id: 2 ,
#       creator_user_name: 'User2',
#       preferences: 'preferencessss',
#       payer_id: 1,
#       recipient_id: 2,
#       type_id: 1
#     )
#     @akt = assign(:akt, Akt.create!(
#       :contract => @contract,
#       :sum => "9.99",
#       :scan_path => "MyString",
#       :text_path => "MyString",
#       :is_signed => false,
#       :is_deleted => false,
#       :is_taken_as_original => false
#     ))
#   end

#   it "renders the edit akt form" do
#     render

#     assert_select "form[action=?][method=?]", akt_path(@akt), "post" do

#       assert_select "input[name=?]", "akt[contract_id]"

#       assert_select "input[name=?]", "akt[sum]"

#       assert_select "input[name=?]", "akt[scan_path]"

#       assert_select "input[name=?]", "akt[text_path]"

#       assert_select "input[name=?]", "akt[is_signed]"

#       assert_select "input[name=?]", "akt[is_deleted]"

#       assert_select "input[name=?]", "akt[is_taken_as_original]"
#     end
#   end
# end
