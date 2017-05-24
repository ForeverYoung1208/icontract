# require 'rails_helper'

# RSpec.describe "reminders/new", type: :view do
#   before(:each) do
#     @reminder_type = ReminderType.create!( attributes_for(:reminder_type) )    
#     assign(:reminder, Reminder.new(
#       :reminder_type => @reminder_type,
#       :dd => "9.99",
#       :mm => "9.99",
#       :yyyy => "9.99",
#       :dofw => "9.99",
#       :moq => "9.99",
#       :is_active => false
#     ))
#   end

#   it "renders new reminder form" do
#     render

#     assert_select "form[action=?][method=?]", reminders_path, "post" do

#       assert_select "input[name=?]", "reminder[type_id]"

#       assert_select "input[name=?]", "reminder[dd]"

#       assert_select "input[name=?]", "reminder[mm]"

#       assert_select "input[name=?]", "reminder[yyyy]"

#       assert_select "input[name=?]", "reminder[dofw]"

#       assert_select "input[name=?]", "reminder[moq]"

#       assert_select "input[name=?]", "reminder[is_active]"
#     end
#   end
# end
