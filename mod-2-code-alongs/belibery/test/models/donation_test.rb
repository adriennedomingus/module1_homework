require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  test "with valid attributes" do
    result = Donation.new(amount: 35, status: "processed")

    assert result.valid?
  end

  test "donation amount must be whole number" do
    result = Donation.new(amount: 35.5, status: "processed")

    assert result.invalid?
  end

  test "donation must have status" do
    result = Donation.new(amount: 35)

    assert result.invalid?
  end

  test "donation must have approved status" do
    result = Donation.new(amount: 35, status: "unapproved")

    assert result.invalid?
  end

  test "donation amount cannot be 1" do
    result = Donation.new(amount: 1, status: "processed")

    assert result.invalid?
  end

  should belong_to(:fan)
end
