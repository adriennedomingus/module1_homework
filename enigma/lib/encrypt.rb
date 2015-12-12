class Encrypt
  attr_accessor :characters_and_indices
  def initialize(key, date)
    @key = key
    @date = date
  end

  def character_chart
    characters = []
    characters << ("a".."z").to_a
    characters << (0..9).to_a
    characters << " "
    characters << "."
    characters << ","
    characters = characters.flatten
    indices = []
    indices = (0..38).to_a.flatten
    @characters_and_indices = Hash[characters.zip(indices)]
  end

  def date_offset
    @date = Time.now.strftime("%d%m%y").to_i
    offset = @date ** 2
    @date_key = offset.to_s.split("")[-4..-1].join
    @date_key
  end

  def date_rotation
    date_offset
    a_date_rotation = @date_key[0].to_i
    b_date_rotation = @date_key[1].to_i
    c_date_rotation = @date_key[2].to_i
    d_date_rotation = @date_key[3].to_i
    @date_rotations = [a_date_rotation, b_date_rotation, c_date_rotation, d_date_rotation]
    @date_rotations
  end

  def key_rotation
    a_key_rotation = @key.to_s[0..1].to_i
    b_key_rotation = @key.to_s[1..2].to_i
    c_key_rotation = @key.to_s[2..3].to_i
    d_key_rotation = @key.to_s[3..4].to_i
    @key_rotations = [a_key_rotation, b_key_rotation, c_key_rotation, d_key_rotation]
    @key_rotations
  end

  def overall_rotation
    date_rotation
    key_rotation
    a_overall_rotation = @date_rotations[0] + @key_rotations[0]
    b_overall_rotation = @date_rotations[1] + @key_rotations[1]
    c_overall_rotation = @date_rotations[2] + @key_rotations[2]
    d_overall_rotation = @date_rotations[3] + @key_rotations[3]
    @overall_rotations = [a_overall_rotation, b_overall_rotation, c_overall_rotation, d_overall_rotation]
    @overall_rotations
  end

  def map_letter(letter)
    character_chart
    @characters_and_indices.each do |character, index|
      if letter == character
        return index
      end
    end
  end

  def map_message(message)
    message_characters = message.chars
    message_characters.map do |character|
      map_letter(character)
    end
  end

  def which_rotator(message)
    index_of_character = map_message(message)
    rotators = []
    shovels = (index_of_character.length / 4.0).ceil
    shovels.times do
      rotators << "a rotator"
      rotators << "b rotator"
      rotators << "c rotator"
      rotators << "d rotator"
    end
    until rotators.length == index_of_character.length
      rotators.pop
    end
    index_of_character.zip(rotators)
  end

  def rotate_message(message)
    characters_and_rotators = which_rotator(message)
    index_of_character = map_message(message)

  end

end

# static_date = Time.new 1983, 3, 14
# e = Encrypt.new(Random.rand(0..99999).to_s)
# e = Encrypt.new("52341")
# e = Encrypt.new(Time.now.strftime("%d%m%y").to_i))
# e = Encrypt.new(static_date)
