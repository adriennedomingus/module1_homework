def solution(a)
  total = a.reduce(0){|sum,x| sum + x }
  min = 0
  head = 0
  tail = 0
  a.each_with_index do |element, index|
    if index == 0
      head = element
      tail = total - element
    elsif index < (a.length - 1)
      head += element
      tail -= element
    end
    difference = (tail - head).abs
    if min == 0 || difference < min
      min = difference
    end
  end
  min
end
