require 'test_helper'

class UserDeletesACategoryTest < ActionDispatch::IntegrationTest

  test "admin deletes a category" do
    user = User.create(username: "adrienne", password: "password", role: 1)
    category1 = Category.create(name: "Garden")
    user.tools.create(name: "Hammer", quantity: 10, price: 1341341, category_id: category1.id)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_category_path(category1)

    click_on "Delete Category"

    refute page.has_content?(category1.name)
  end

  test "non-admin cannot delete a category" do
    user = User.create(username: "adrienne", password: "password", role: 0)
    category1 = Category.create(name: "Garden")
    user.tools.create(name: "Hammer", quantity: 10, price: 1341341, category_id: category1.id)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_category_path(category1)

    assert page.has_content?("The page you were looking for doesn't exist")
  end
end
