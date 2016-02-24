require 'test_helper'

class AdminSeesCategoriesTest < ActionDispatch::IntegrationTest

  test "admin can see all categories" do
    user = User.create(username: "adrienne", password: "password", role: 1)
    category1 = Category.create(name: "Garden")
    category2 = Category.create(name: "Power")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_categories_path

    assert page.has_link?(category1.name), href: admin_category_path(category1)
    assert page.has_link?(category2.name), href: admin_category_path(category2)

    click_on("Garden")

    assert page.has_content?("Garden")

  end

  test "non-admin cannot see categories" do
    user = User.create(username: "adrienne", password: "password", role: 0)
    Category.create(name: "Garden")
    Category.create(name: "Power")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_categories_path

    assert page.has_content?("The page you were looking for doesn't exist")
  end
end
