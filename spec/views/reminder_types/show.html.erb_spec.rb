require 'rails_helper'

RSpec.describe "reminder_types/show", type: :view do
  before(:each) do
    @reminder_type = assign(:reminder_type, ReminderType.create!(
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
