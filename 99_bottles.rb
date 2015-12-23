#https://github.com/turingschool/challenges/blob/master/99_bottles.markdown

bottles = 99
while bottles > 2
  puts "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer."
  puts "Take one down and pass it around, #{bottles - 1} bottles of beer on the wall."
  bottles -= 1
end

while bottles == 2
  puts "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer."
  puts "Take one down and pass it around, #{bottles - 1} bottle of beer on the wall."
  bottles -= 1
end

while bottles == 1
  puts "#{bottles} bottle of beer on the wall, #{bottles} bottle of beer."
  puts "Take one down and pass it around, no more bottles of beer on the wall."
  puts "No more bottles of beer on the wall, no more bottles of beer."
  puts "Go to the store and buy some more, 99 bottles of beer on the wall. "
  bottles -= 1
end
