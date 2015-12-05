#https://github.com/turingschool/waypoints#object-oriented-programming

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'waypoint2'

class Waypoint2Test < Minitest::Test

  def test_can_play_specific_songs

    mp = MusicPlayer.new(['Born This Way', 'Shake It Off', 'Sandstorm'])

    mp.play(2)
    assert_equal "Sandstorm", mp.playing # => "Sandstorm"

    mp.play(0)
    assert_equal "Born This Way", mp.playing # => "Born This Way"

    mp.play(1)
    assert_equal "Shake It Off", mp.playing # => "Shake It Off"
  end
end
