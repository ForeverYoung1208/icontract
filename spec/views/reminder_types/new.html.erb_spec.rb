require 'rails_helper'

RSpec.describe "reminder_types/new", type: :view do
  before(:each) do
    assign(:reminder_type, ReminderType.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new reminder_type form" do
    render

    assert_select "form[action=?][method=?]", reminder_types_path, "post" do

      assert_select "input[name=?]", "reminder_type[name]"

      assert_select "textarea[name=?]", "reminder_type[description]"
    end
  end
end
