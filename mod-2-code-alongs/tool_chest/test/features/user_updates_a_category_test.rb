require 'test_helper'

class UserUpdatesACategoryTest < ActionDispatch::IntegrationTest

  test "admin can update a category" do
    user = User.create(username: "adrienne", password: "password", role: 1)
    category1 = Category.create(name: "Garden")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit edit_admin_category_path(category1)

    fill_in "Name", with: "Outdoor"
    click_on "Update Category"

    assert page.has_link?("Outdoor"), href: admin_category_path(category1)
  end

  test "non-admin cannot update a category" do
    user = User.create(username: "adrienne", password: "password", role: 0)

    category1 = Category.create(name: "Garden")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit edit_admin_category_path(category1)

    assert page.has_content?("The page you were looking for doesn't exist")

  end
end
