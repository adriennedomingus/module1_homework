def solution(array)
  min = 0
  array.each_with_index do |_, index|
    head = find_head(array, index)
    tail = find_tail(array, index)
    difference = (tail - head).abs
    if min == 0 || difference < min
      min = difference
    end
  end
  min
end

def find_tail(array, index)
  tail = 0
  tail_index = index + 1
  until tail_index == array.length
    tail += array[tail_index]
    tail_index += 1
  end
  tail
end

def find_head(array, index)
  head = 0
  head_index = index
  until head_index == -1
    head += array[head_index]
    head_index -= 1
  end
  head
end
