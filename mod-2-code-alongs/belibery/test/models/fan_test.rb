require 'test_helper'

class FanTest < ActiveSupport::TestCase

  def valid_attributes
    {
      name: "Jorge",
      email: "yosoybelieber@example.com",
    }
  end

  test "it creates a fan" do
    result = Fan.new(valid_attributes)

    assert result.valid?
    assert_equal "Jorge", result.name
    assert_equal "yosoybelieber@example.com", result.email
  end

  test "it cannot create a fan without a name" do
    result = Fan.new(email: "yosoybelieber@example.com")

    assert result.invalid?
  end

  test "it cannot create a fan without an email" do
    result = Fan.new(name: "Adrienne")

    assert result.invalid?
  end

  test "it cannot create a fan with the same email" do
    2.times { Fan.create(valid_attributes)}

    result = Fan.where(email: "yosoybelieber@example.com")
    assert_equal 1, result.count
  end

  test "returns list of fans ordered alphabetically by name" do
    fan1 = Fan.create(name: "Justin", email: "justin@example.com")
    fan2 = Fan.create(name: "Adrienne", email: "adrienne@example.com")
    fan3 = Fan.create(name: "Mackenzie", email: "mackenzie@example.com")

    assert_equal [fan2, fan1, fan3], Fan.all
  end

  test "joined since returns fans" do
    fan1 = Fan.create(name: "Justin", email: "justin@example.com", created_at: "2000-02-17 21:17:44")
    fan2 = Fan.create(name: "Adrienne", email: "adrienne@example.com", created_at: "1989-02-17 21:17:44")
    fan3 = Fan.create(name: "Mackenzie", email: "mackenzie@example.com", created_at: "2016-02-17 21:17:44")

    assert_equal [fan1, fan3], Fan.joined_since("1999-02-17 21:17:44")
    # assert_equal [fan3], Fan.joined_since("2001-02-17 21:17:44")

  end
end
