require 'test_helper'

class ToolCreationTest < ActionDispatch::IntegrationTest

  test "user can create a tool" do
    user = User.create(username: "adrienne", password: "password")
    visit login_path
    fill_in "Username", with: "adrienne"
    fill_in "Password", with: "password"
    click_on "Login"
    
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
end
