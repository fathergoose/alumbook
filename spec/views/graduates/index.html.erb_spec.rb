require 'rails_helper'

RSpec.describe "graduates/index", type: :view do
  before(:each) do
    assign(:graduates, [
      Graduate.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => "Phone",
        :current_title => "Current Title",
        :current_employer => "Current Employer"
      ),
      Graduate.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => "Phone",
        :current_title => "Current Title",
        :current_employer => "Current Employer"
      )
    ])
  end

  it "renders a list of graduates" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Current Title".to_s, :count => 2
    assert_select "tr>td", :text => "Current Employer".to_s, :count => 2
  end
end
