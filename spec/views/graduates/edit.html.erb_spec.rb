require 'rails_helper'

RSpec.describe "graduates/edit", type: :view do
  before(:each) do
    @graduate = assign(:graduate, Graduate.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :current_title => "MyString",
      :current_employer => "MyString"
    ))
  end

  it "renders the edit graduate form" do
    render

    assert_select "form[action=?][method=?]", graduate_path(@graduate), "post" do

      assert_select "input#graduate_first_name[name=?]", "graduate[first_name]"

      assert_select "input#graduate_last_name[name=?]", "graduate[last_name]"

      assert_select "input#graduate_email[name=?]", "graduate[email]"

      assert_select "input#graduate_phone[name=?]", "graduate[phone]"

      assert_select "input#graduate_current_title[name=?]", "graduate[current_title]"

      assert_select "input#graduate_current_employer[name=?]", "graduate[current_employer]"
    end
  end
end
