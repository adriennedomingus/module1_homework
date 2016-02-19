require 'test_helper'

class UserCanEditAToolTest < ActionDispatch::IntegrationTest

  test "user can adit an existing tool" do
    tool = Tool.create(name: "screwdriver", quantity: 10, price: 10000)

    visit edit_tool_path(tool)

    fill_in "Name", with: "wrench"
    fill_in "tool[quantity]", with: "5"
    fill_in "Price", with: "2000"
    click_link_or_button "Update Tool"

    assert_equal current_path, tool_path(tool)
    within ".tool_info" do
      assert page.has_content?("wrench")
      assert page.has_content?("5")
      assert page.has_content?("20.0")
    end
  end

end
