class Crack
  def initialize(message, date)
    @date = date
    @message = message
  end

  def character_chart
    characters = []
    characters << ("a".."z").to_a
    characters << "0"
    characters << "1"
    characters << "2"
    characters << "3"
    characters << "4"
    characters << "5"
    characters << "6"
    characters << "7"
    characters << "8"
    characters << "9"
    characters << " "
    characters << "."
    characters << ","
    characters = characters.flatten
    indices = []
    indices = (0..38).to_a.flatten
    @characters_and_indices = Hash[characters.zip(indices)]
  end

  def map_end_of_encrypted
    @message_end = map_message(@message)
    loop do
      @message_end.shift
      break if @message_end.length == 4
    end
    @message_end
  end

  def end_indices
    [13, 3, 37, 37]
  end

  def overall_rotators
    end_indices
    map_end_of_encrypted
    i = 0
    overall_rotators = []
    4.times do
      i += 1
      rotator = @message_end[i - 1] - end_indices[i-1]
      if rotator < 0
        rotator = rotator + 39
      else
        rotator
      end
      overall_rotators << rotator
    end
    overall_rotators
  end

  def order_of_rotators
    @shift_rotator = (@message.length - 7) % 4
    @shift_rotator
  end

  def all_rotators
    overall_rotators
    order_of_rotators
    if @shift_rotator == 1
      @overall_rotations = overall_rotators
    elsif @shift_rotator == 2
      @overall_rotations = [overall_rotators[1], overall_rotators[2], overall_rotators[3], overall_rotators[0]]
    elsif @shift_rotator == 3
      @overall_rotations = [overall_rotators[2], overall_rotators[3], overall_rotators[0], overall_rotators[1]]
    elsif @shift_rotator == 0
      @overall_rotations = [overall_rotators[3], overall_rotators[0], overall_rotators[1], overall_rotators[2]]
    end
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
    message_characters = @message.chars
    message_characters.map do |character|
      map_letter(character)
    end
  end

  def which_rotator(message)
    all_rotators
    initial_indices = map_message(message)
    rotators = []
    shovels = (initial_indices.length / 4.0).ceil
    shovels.times do
      rotators << @overall_rotations[0]
      rotators << @overall_rotations[1]
      rotators << @overall_rotations[2]
      rotators << @overall_rotations[3]
    end
    until rotators.length == initial_indices.length
      rotators.pop
    end
    initial_indices.zip(rotators)
  end

  def rotate_message(message)
    indices_and_rotators = which_rotator(message)
    new_indices = []
    i = 0
    indices_and_rotators.length.times do
      i += 1
      new_indices << (indices_and_rotators[i-1][0] - (indices_and_rotators[i-1][1] % 39))
     end
     new_indices.map do |index|
       if index < 0
         index + 39
       else
         index
       end
     end
  end

  def decrypt(message)
    new_indices = rotate_message(message)
    decrypted_message = []
    new_indices.each do |index|
      @characters_and_indices.each do |character, location|
        if index == location
          decrypted_message << character
        end
      end
    end
    decrypted_message.join
  end

end
