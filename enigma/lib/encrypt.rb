class Encrypt
  attr_accessor :characters_and_indices
  # def initialize
  # end

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
    date = Time.now.strftime("%d%m%y").to_i
    date_offset = date ** 2
    @date_key = date_offset.to_s.split("")[-4..-1].join
  end

  def date_rotation
    @a_date_rotation = @date_key[0].to_i
    @b_date_rotation = @date_key[1].to_i
    @c_date_rotation = @date_key[2].to_i
    @d_date_rotation = @date_key[3].to_i
  end

  def key_rotation
    key = Random.rand(0..99999).to_s
    @a_key_rotation = key[0..1].to_i
    @b_key_rotation = key[1..2].to_i
    @c_key_rotation = key[2..3].to_i
    @d_key_rotation = key[3..4].to_i
  end

  def overall_rotation
    @a_overall_rotation = @a_date_rotation + @a_key_rotation
    @b_overall_rotation = @a_date_rotation + @a_key_rotation
    @c_overall_rotation = @a_date_rotation + @a_key_rotation
    @d_overall_rotation = @a_date_rotation + @a_key_rotation
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
