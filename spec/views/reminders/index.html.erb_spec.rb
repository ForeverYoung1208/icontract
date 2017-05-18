require 'rails_helper'

RSpec.describe "reminders/index", type: :view do
  before(:each) do

    @reminder_type = ReminderType.create!( attributes_for(:reminder_type) )
    
    assign(:reminders, [
      Reminder.create!( attributes_for(:reminder, reminder_type: @reminder_type)),
      Reminder.create!( attributes_for(:reminder, reminder_type: @reminder_type))
    ])

  end

  it "renders a list of reminders" do
    render
    # assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "99".to_s, :count => 4
    assert_select "tr>td", :text => "9999".to_s, :count => 2
    assert_select "tr>td", :text => "9".to_s, :count => 4
    assert_select "tr>td", :text => "2017-05-17".to_s, :count => 4
    assert_select "tr>td", :text => false.to_s, :count => 2

  end
end
