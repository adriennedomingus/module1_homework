class Attempt < ActiveRecord::Base
  belongs_to :level

  def percent_correct
    result = level.text.chars.select.with_index do |character, index|
      character == text[index]
    end.length.to_f / level.text.chars.length.to_f * 100
    result.to_i
  end
end
