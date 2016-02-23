require 'test_helper'

class UserCanLogOutTest < ActionDispatch::IntegrationTest
  test "registered user sees dashboard and welcome message" do
    user = User.create(username: "adrienne", password: "password")

    visit login_path
    fill_in "Username", with: "adrienne"
    fill_in "Password", with: "password"
    click_on "Login"

    assert_equal "/users/#{user.id}", current_path
    assert page.has_content?("Welcome, #{user.username}")

    click_on "Log Out"
    assert page.has_content?("Login"), href: login_path
    refute page.has_content?("Welcome, #{user.username}")

  end

end
