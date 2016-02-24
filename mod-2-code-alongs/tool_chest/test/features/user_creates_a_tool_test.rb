require 'test_helper'

class ToolCreationTest < ActionDispatch::IntegrationTest

  test "user can create a tool for themselves" do
    user = User.create(username: "adrienne", password: "password")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit new_user_tool_path(user)

    fill_in "Name", with: "Screwdriver"
    fill_in "Price", with: "1099"
    fill_in "Quantity", with: "10"
    click_link_or_button "Create Tool"

    assert_equal current_path, user_tool_path(user, Tool.last)

    within(".tool_info") do
      assert page.has_content?("Screwdriver")
      assert page.has_content?("10.99")
      assert page.has_content?("10")
    end
  end

  test "user cannot create tool for another user" do
    user = User.create(username: "adrienne", password: "password")
    other_user = User.create(username: "justin", password: "password")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit new_user_tool_path(other_user)

    assert page.has_content?("The page you were looking for doesn't exist")
  end

  test "admin creates tool for other user" do
    admin = User.create(username: "adrienne", password: "password", role: 1)
    user = User.create(username: "justin", password: "password")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit new_admin_user_tool_path(user)

    fill_in "Name", with: "Screwdriver"
    fill_in "Price", with: "1099"
    fill_in "Quantity", with: "10"
    click_link_or_button "Create Tool"
    # assert_equal current_path, user_tool_path(user, Tool.last)
  
    within(".tool_info") do
      assert page.has_content?("Screwdriver")
      assert page.has_content?("10.99")
      assert page.has_content?("10")
    end
  end

end
