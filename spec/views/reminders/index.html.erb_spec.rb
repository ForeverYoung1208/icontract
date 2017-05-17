require 'rails_helper'

RSpec.describe "reminders/index", type: :view do
  before(:each) do
    assign(:reminders, [
      Reminder.create!(
        :type => nil,
        :dd => "9.99",
        :mm => "9.99",
        :yyyy => "9.99",
        :dofw => "9.99",
        :moq => "9.99",
        :is_active => false
      ),
      Reminder.create!(
        :type => nil,
        :dd => "9.99",
        :mm => "9.99",
        :yyyy => "9.99",
        :dofw => "9.99",
        :moq => "9.99",
        :is_active => false
      )
    ])
  end

  it "renders a list of reminders" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
