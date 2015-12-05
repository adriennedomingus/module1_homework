#https://github.com/turingschool/waypoints#object-oriented-programming

class MusicPlayer

  @songs = ['Born This Way', 'Shake It Off', 'Sandstorm']

  attr_accessor :songs, :title

  def initialize(songs)
    @songs = songs
    @title = title
  end

  def play(track)
    @title = @songs[track]
  end

  def playing
    @title
  end

end
