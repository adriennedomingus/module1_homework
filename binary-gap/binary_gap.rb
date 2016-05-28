class BinaryGap
  attr_accessor :decimal

  def initialize(decimal)
    @decimal = decimal
  end

  def to_binary
    decimal.to_s(2)
  end

  def solution
    max_gap = 0
    current_gap = 0
    number = to_binary.split("")
    until number.empty?
      if number.shift == "0"
        current_gap += 1
      elsif current_gap >= max_gap
        max_gap = current_gap
        current_gap = 0
      else
        current_gap = 0
      end
    end
    max_gap
  end

end
