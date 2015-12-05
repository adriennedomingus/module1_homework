#https://github.com/turingschool/waypoints#object-oriented-programming

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'waypoint1'

class WaypointTest < Minitest::Test

  def test_can_gallop_and_rest
    bessie = Horse.new
    anakin = Horse.new

    refute bessie.galloping? # => false
    refute anakin.galloping? # => false

    bessie.gallop
    assert bessie.galloping? # => true
    refute anakin.galloping? # => false

    bessie.rest
    anakin.gallop
    refute bessie.galloping? # => false
    assert anakin.galloping? # => true
  end

end
