require 'rails_helper'

RSpec.describe "reminders/edit", type: :view do
  before(:each) do

    @reminder_type = ReminderType.create!( attributes_for(:reminder_type) )
    
    @reminder = assign(:reminder, Reminder.create!( attributes_for(:reminder, reminder_type: @reminder_type,  reminderable: nil) ))

  end

  it "renders the edit reminder form" do
    render

    assert_select "form[action=?][method=?]", reminder_path(@reminder), "post" do

      assert_select "input[name=?]", "reminder[type_id]"

      assert_select "input[name=?]", "reminder[dd]"

      assert_select "input[name=?]", "reminder[mm]"

      assert_select "input[name=?]", "reminder[yyyy]"

      assert_select "input[name=?]", "reminder[dofw]"

      assert_select "input[name=?]", "reminder[moq]"

      assert_select "input[name=?]", "reminder[is_active]"
    end
  end
end
