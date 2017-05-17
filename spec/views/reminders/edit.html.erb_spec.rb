require 'rails_helper'

RSpec.describe "reminders/edit", type: :view do
  before(:each) do
    @reminder = assign(:reminder, Reminder.create!(
      :type => nil,
      :dd => "9.99",
      :mm => "9.99",
      :yyyy => "9.99",
      :dofw => "9.99",
      :moq => "9.99",
      :is_active => false
    ))
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
