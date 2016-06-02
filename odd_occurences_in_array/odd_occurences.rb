def solution(a)
  a.group_by do |element|
    element
  end.each_value do |item_group|
    return item_group[0] if item_group.length.odd?
  end
end
