require 'set'

def solution(x, a)
  leaves = Set.new
  a.each_with_index do |leaf_position, index|
    leaves << leaf_position if leaf_position <= x
    return index if leaves.length >= x
  end
  -1
end
