def solution(a)
  sorted = a.sort
  return 0 if sorted[0] != 1
  sorted.each.with_index do |element, index|
    return 0 if sorted[index + 1] != element + 1 && index != sorted.length - 1
  end
  1
end
