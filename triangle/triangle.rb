def solution(a)
  return 0 if a.length < 3
  sorted = a.sort
  sorted.each_with_index do |side, index|
    return 1 if sorted[index + 2] && side + sorted[index + 1] > sorted[index + 2]
  end
  0
end
