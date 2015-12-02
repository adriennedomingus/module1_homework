#Easy Looping
5.times do
  puts "Line"
end

# #Looping with a Condition

line = 0

5.times do
  line += 1
  if line.odd? == true
    puts "line is even"
  else
    puts "line is odd"
  end
end

#Three Loops
line = 0

5.times do
  line += 1
  puts "This is my output line #{line}"
end

while line < 5
  line += 1
  puts "This is my output line #{line}"
end

i = 0
loop do
  i += 1
  puts "This is my output line #{i}"
  break if i == 5
end

#Rando-Gusser
secret_number = rand(0..10)
guess = rand(0..10)

puts "(The secret number is #{secret_number})"
while guess != secret_number
  puts "Guess is #{guess}"
  puts "Guess again!"
  guess = rand(0..10)
end

puts "Guess is #{guess}"
puts "You win!"


puts "(The secret number is #{secret_number})"

loop do
  puts "Guess is #{guess}"
  puts "Guess again!"
  guess = rand(0..10)
  break if guess == secret_number
end

puts "Guess is #{guess}"
puts "You win!"
