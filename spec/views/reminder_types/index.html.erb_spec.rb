require 'rails_helper'

RSpec.describe "reminder_types/index", type: :view do
  before(:each) do
    assign(:reminder_types, [
      ReminderType.create!(
        :name => "Name",
        :description => "MyText"
      ),
      ReminderType.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of reminder_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
