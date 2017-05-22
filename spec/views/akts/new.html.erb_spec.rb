# require 'rails_helper'

# RSpec.describe "akts/new", type: :view do
#   before(:each) do
#     assign(:akt, Akt.new(
#       :contract => nil,
#       :sum => "9.99",
#       :scan_path => "MyString",
#       :text_path => "MyString",
#       :is_signed => false,
#       :is_deleted => false,
#       :is_taken_as_original => false
#     ))
#   end

#   it "renders new akt form" do
#     render

#     assert_select "form[action=?][method=?]", akts_path, "post" do

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
