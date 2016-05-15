require 'rails_helper'

RSpec.describe "graduates/show", type: :view do
  before(:each) do
    @graduate = assign(:graduate, Graduate.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :phone => "Phone",
      :current_title => "Current Title",
      :current_employer => "Current Employer"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Current Title/)
    expect(rendered).to match(/Current Employer/)
  end
end
