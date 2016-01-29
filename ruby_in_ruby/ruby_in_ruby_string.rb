class SimpleString
  attr_reader :data

  UPCASE_CHARACTERS = { "a" => "A", "b" => "B", "c" => "C", "d" => "D",
                        "e" => "E", "f" => "F", "g" => "G", "h" => "H",
                        "i" => "I", "j" => "J", "k" => "K", "l" => "L",
                        "m" => "M", "n" => "N", "o" => "O", "p" => "P",
                        "q" => "Q", "r" => "R", "s" => "S", "t" => "T",
                        "u" => "U", "v" => "V", "w" => "W", "x" => "X",
                        "y" => "Y", "z" => "Z" }

  def initialize(the_data = "")
    @data = the_data
  end

  def length
    data.chars.count
  end

  def end_with?(test_string)
    data.chars[-test_string.length..-1] == test_string.chars
  end

  def upcase
    result = ""
    data.chars.each do |character|
      result << upcase_character(character)
    end
    result
  end

  def upcase_character(character)
    UPCASE_CHARACTERS[character]
  end

  def +(second_string)
    result = []
    result << self.data
    result << second_string.data
    result.join
  end
end
