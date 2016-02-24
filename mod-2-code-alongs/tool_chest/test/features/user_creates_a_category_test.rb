require 'test_helper'

class UserCreatesAToolTest < ActionDispatch::IntegrationTest

  test "admin creates a category" do
    admin = User.create(username: "adrienne", password: "password", role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit new_admin_category_path

    fill_in "Name", with: "Garden"
    click_on "Create Category"
    
    assert page.has_link?("Garden"), href: admin_category_path(Category.last)
  end

  test "non-admins cannot create categories" do
    user = User.create(username: "adrienne", password: "password", role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit new_admin_category_path

    assert page.has_content?("The page you were looking for doesn't exist")
  end
end
