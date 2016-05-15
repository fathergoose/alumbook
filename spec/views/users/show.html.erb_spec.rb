require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :current_title => "Current Title",
      :current_employer => "Current Employer",
      :cohort_id => 1,
      :user_type => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Current Title/)
    expect(rendered).to match(/Current Employer/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
