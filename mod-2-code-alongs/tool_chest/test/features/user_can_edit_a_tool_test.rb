require 'test_helper'

class UserCanEditAToolTest < ActionDispatch::IntegrationTest

  test "user can adit an existing tool if it belongs to them" do
    user = User.create(username: "adrienne", password: "password")
    other_user = User.create(username: "justin", password: "password")
    visit login_path
    fill_in "Username", with: "adrienne"
    fill_in "Password", with: "password"
    click_on "Login"
    tool = user.tools.create(name: "screwdriver", quantity: 10, price: 10000)

    visit edit_user_tool_path(user, tool)

    fill_in "Name", with: "wrench"
    fill_in "tool[quantity]", with: "5"
    fill_in "Price", with: "2000"
    click_link_or_button "Update Tool"

    assert_equal current_path, user_tool_path(user, tool)
    within ".tool_info" do
      assert page.has_content?("wrench")
      assert page.has_content?("5")
      assert page.has_content?("20.0")
    end
  end

  test "user cannot edit a tool that doesn't belong to them" do
    user = User.create(username: "adrienne", password: "password")
    other_user = User.create(username: "justin", password: "password")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    tool = user.tools.create(name: "screwdriver", quantity: 10, price: 10000)
    other_tool = other_user.tools.create(name: "hammer", quantity: 10, price: 3000)

    visit edit_user_tool_path(other_user, other_tool)

    # assert_equal current_path, user_tool_path(other_user, other_tool)
    assert page.has_content?("The page you were looking for doesn't exist")

    refute page.has_content?("wrench")
    refute page.has_content?("5")
    refute page.has_content?("20.0")
  end

  test "admin can create tools for any user" do
  end

end
