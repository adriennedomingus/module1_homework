require 'test_helper'

class LocationTest < ActiveSupport::TestCase

  test "it is created with valid input" do
    result = Location.new(city: "Denver", state: "CO", country: "United States")
    assert result.valid?
  end

  test "it must have a city state and country" do
    result1 = Location.new(state: "CO", country: "United States")
    result2 = Location.new(city: "Denver", country: "United States")
    result3 = Location.new(city: "Denver", state: "CO")

    assert result1.invalid?
    assert result2.invalid?
    assert result3.invalid?
  end

  test "a state has two characters" do
    result = Location.new(city: "Denver", state: "Colorado", country: "United States")
    result2 = Location.new(city: "Denver", state: "C", country: "United States")

    assert result.invalid?
    assert result2.invalid?
  end

  test "cities are unique within the scope of the state" do
    result = Location.create(city: "Denver", state: "CO", country: "United States")
    result2 = Location.new(city: "Denver", state: "IN", country: "United States")
    result3 = Location.new(city: "Denver", state: "CO", country: "United States")

    assert result2.valid?
    assert result3.invalid?
  end

  test "a city can have only letters and spaces" do
    result = Location.new(city: "Denver3", state: "CO", country: "United States")
    result1 = Location.new(city: "New York", state: "CO", country: "United States")

    assert result1.valid?
    assert result.invalid?
  end

  test "retuns full name of location" do
    result = Location.new(city: "Denver", state: "CO", country: "United States")

    assert_equal "Denver, CO, United States", result.full_name
  end
end
