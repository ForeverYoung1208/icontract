# require 'rails_helper'

# RSpec.describe "akts/index", type: :view do
#   before(:each) do
#     assign(:akts, [
#       Akt.create!(
#         :contract => nil,
#         :sum => "9.99",
#         :scan_path => "Scan Path",
#         :doc_path => "Doc Path",
#         :is_signed => false,
#         :is_deleted => false,
#         :is_taken_as_original => false
#       ),
#       Akt.create!(
#         :contract => nil,
#         :sum => "9.99",
#         :scan_path => "Scan Path",
#         :doc_path => "Doc Path",
#         :is_signed => false,
#         :is_deleted => false,
#         :is_taken_as_original => false
#       )
#     ])
#   end

#   it "renders a list of akts" do
#     render
#     assert_select "tr>td", :text => nil.to_s, :count => 2
#     assert_select "tr>td", :text => "9.99".to_s, :count => 2
#     assert_select "tr>td", :text => "Scan Path".to_s, :count => 2
#     assert_select "tr>td", :text => "Doc Path".to_s, :count => 2
#     assert_select "tr>td", :text => false.to_s, :count => 2
#     assert_select "tr>td", :text => false.to_s, :count => 2
#     assert_select "tr>td", :text => false.to_s, :count => 2
#   end
# end
