require 'test_helper'

class UserSeesOnlyTheirToolsTest < ActionDispatch::IntegrationTest
  test "user sees only their tools" do
    user1 = User.create(username: "adrienne", password: "password")
    user2 = User.create(username: "justin", password: "password")

    user2.tools.create(name: "axe", quantity: 12, price: 168464)
    user1.tools.create(name: "hammer", quantity: 14, price: 1343143)
    user1.tools.create(name: "saw", quantity: 13, price: 12351)

    visit login_path
    fill_in "Username", with: "adrienne"
    fill_in "Password", with: "password"
    click_on "Login"

    visit user_tools_path(user1)
    assert page.has_content?("hammer")
    assert page.has_content?("saw")
    refute page.has_content?("axe")
  end

end
