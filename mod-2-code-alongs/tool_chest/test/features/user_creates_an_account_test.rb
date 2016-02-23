require 'test_helper'

class UserCreatesAnAccountTest < ActionDispatch::IntegrationTest
  test "user sees dashboard and welcome message" do
    visit '/'
    click_on "Register"
    fill_in "Username", with: "adrienne"
    fill_in "Password", with: "password"
    click_on "Create Account"

    user = User.last

    assert_equal "/users/#{user.id}", current_path
    assert page.has_content?("Welcome, #{user.username}")
  end

end
