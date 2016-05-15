require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :current_title => "MyString",
      :current_employer => "MyString",
      :cohort_id => 1,
      :user_type => 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_first_name[name=?]", "user[first_name]"

      assert_select "input#user_last_name[name=?]", "user[last_name]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_current_title[name=?]", "user[current_title]"

      assert_select "input#user_current_employer[name=?]", "user[current_employer]"

      assert_select "input#user_cohort_id[name=?]", "user[cohort_id]"

      assert_select "input#user_user_type[name=?]", "user[user_type]"
    end
  end
end
