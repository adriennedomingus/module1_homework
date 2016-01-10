#https://github.com/turingschool/challenges/blob/master/credit_check.markdown

class CreditCheck

  def self.double_every_other(number)
    split_num = number.chars.map do |num|
      num.to_i
    end
    if split_num.length % 2 == 0
      split_num.map.with_index { |num, index| index.even? ? num * 2 : num }
    else
      split_num.map.with_index { |num, index| index.odd? ? num * 2 : num }
    end
  end

  def self.add_double_digits(number)
    double_every_other(number).map do |num|
      if num > 9
        nums = num.to_s.chars
        nums[0].to_i + nums[1].to_i
      else
        num
      end
    end
  end

  def self.add_all(number)
    add_double_digits(number).reduce do |sum, num|
      sum += num
    end
  end

  def self.valid?(number)
    add_all(number) % 10 == 0
  end
end
