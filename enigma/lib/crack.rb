require_relative 'decrypt'

class Crack < Decrypt
  def initialize(message, date)
    @date = date
    @message = message
  end

  def map_last_four_of_encrypted
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
    map_last_four_of_encrypted
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

  def combined_rotation
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

  def crack(message)
    new_indices = rotate_encrypted_message(message)
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
