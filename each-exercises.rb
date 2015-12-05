#https://github.com/turingschool/lesson_plans/blob/master/ruby_01-object_oriented_programming_with_ruby/primer_on_each.markdown

array = [1,2,3,4]

doubled = array.each do |number|
  puts number * 2
end

evens = array.each do |number|
  puts number if number.even?
end

odds = array.each do |number|
  puts number if number.odd?
end

names = ["Alice Smith", "Bob Evans", "Roy Rogers"]

names.each do |name|
  puts "#{name} \n"
end

names.each do |name|
  puts name.split[0]
end

names.each do |name|
  puts name.split[1]
end

names.each do |name|
  puts name.split[0][0] + name.split[1][0]
end

names.each do |name|
  puts "#{name.split[1]}: #{name.split[1].length}"
end

total = 0
names.each do |name|
  total += name.length
end
puts total
