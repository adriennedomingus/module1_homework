require 'test_helper'

class UserLogsOutOfAccountTest < FeatureTest
  test "user sees option to log in" do
    user = User.create(username: "adrienne", password: "password")
    # session[:user_id] = user.id
    visit login_path
    fill_in "Username", with: "adrienne"
    fill_in "Password", with: "password"
    click_on "Login"

    assert_equal "/users/#{user.id}", current_path
    assert page.has_content?("Welcome, #{user.username}")

    click_on "logout"
    assert page.has_content?("login")
    refute page.has_content?("Welcome, #{user.username}")
  end
end
