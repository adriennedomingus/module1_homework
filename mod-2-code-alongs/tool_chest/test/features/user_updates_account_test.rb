require 'test_helper'

class UserUpdatesAccountTest < ActionDispatch::IntegrationTest

  test "user updates their own account" do
    user = User.create(username: "adrienne", password: "password")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit edit_user_path(user)
    fill_in "Username", with: "lydia"
    fill_in "Password", with: "new_password"
    click_on "Create Account"

    assert page.has_content?("Welcome, #{user.username}")
  end

  test "user cannot update another user's account" do
    user = User.create(username: "adrienne", password: "password")
    other_user = User.create(username: "justin", password: "password")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit edit_user_path(other_user)
    assert page.has_content?("The page you were looking for doesn't exist")
  end

  test "admin cannot update another user's account" do
    admin = User.create(username: "adrienne", password: "password", role: 1)
    other_user = User.create(username: "justin", password: "password")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit edit_user_path(other_user)
    assert page.has_content?("The page you were looking for doesn't exist")

  end
end
