#https://github.com/turingschool/challenges/blob/master/cryptographer.markdown

class EncryptionEngine

  def encrypt
  end

  def decrypt
  end
end

class Rotator

  def character_map
    @characters_and_indices = {"a" => 0, "b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7,
                              "i" => 8, "j" => 9, "k" => 10, "l" => 11, "m" => 12, "n" => 13, "o" => 14, "p" => 15,
                              "q" => 16, "r" => 17, "s" => 18, "t" => 19, "u" => 20, "v" => 21, "w" => 22, "x" => 23,
                              "y" => 24, "z" => 25, "A" => 26, "B" => 27, "C" => 28, "D" => 29, "E" => 30, "F" => 31,
                              "G" => 32, "H" => 33, "I" => 34, "J" => 35, "K" => 36, "L" => 37, "M" => 38, "N" => 39,
                              "O" => 40, "P" => 41, "Q" => 42, "R" => 43, "S" => 44, "T" => 45, "U" => 46, "V" =>47,
                               "W" => 48, "X" => 49, "Y" => 50, "Z" => 51, "0" => 52, "1" => 53, "2" => 54, "3" => 55,
                               "4" => 56, "5" => 57, "6" => 58, "7" => 59, "8" => 60, "9" => 61, "!" => 62, "@" => 63,
                               "#" => 64, "$" => 65, "%" => 66, "^" => 67, "&" => 68, "*" => 69, "(" => 70, ")" => 71,
                               "[" => 72, "]" => 73, " " => 74, "," => 75, "." => 76, "<" => 77, ">" => 78, ";" => 79,
                               ":" => 80, "/" => 81, "?" => 82, "\\" => 83, "|" => 84}
  end

  def map_single_letter(letter)
    character_map
    @characters_and_indices.each do |key, value|
      if letter == key
        return value
      end
    end
  end

  def map_message(message)
    message.chars.map do |character|
      map_single_letter(character)
    end
  end

  def output_new_message(message)
    @rotated_message = rotate_message(message)
    @new_message = []
      @rotated_message.map do |character_index|
        @characters_and_indices.each do |key, value|
          if character_index == value
            @new_message << key
          end
        end
      end
    @new_message.join
  end

end

class Encrypt < Rotator
  def rotate_message(message)
    message_indices = map_message(message)
    message_indices.map do |index|
      (index + 13) % 85
    end
  end

  def encrypt(message)
    output_new_message(message)
  end
end

class Decrypt < Rotator

  def rotate_message(message)
    message_indices = map_message(message)
    message_indices.map do |index|
      (index - 13) % 85
    end
  end

  def decrypt(message)
    output_new_message(message)
  end
end
