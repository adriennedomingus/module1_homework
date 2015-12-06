#https://github.com/turingschool/lesson_plans/blob/master/ruby_01-object_oriented_programming_with_ruby/problems_solutions_algorithms.markdown

#ODDS AND EVENS
#1. How will you know when the problem is solved?
  #When two new text docs are created, one which lists odd numbers and the other evens
#2. How do you want to use the software?
  #Text document will be uploaded, two new documents created in same directory.
#3. What is the most trivial possible use case?
  #Text document with all the same number
#4. What is the minimum-work case?
  #Text document with all even or all odd numbers
#5. What is the next-most-complex case?
  #Final use case is fairly trivial in itself, even with all random numbers...
#6. Sketch an algorithm (pseudocode)
  #1. Read text file
  #2. Create collection of all numbers
  #3. Separate collection into two: one of odds one of evens
  #4. Print each collection to separate text file
#7. Implement it
#8. Is the whole problem solved? If not, return to 5
#9. Anticipate edge cases
  #Things to consider:
    #What if the file is formatted differently? Numbers separated by commas? etc.
    #What if floats/fractions are included?
#10. Refactor

file = File.read("odds_and_evens.txt")

all_numbers = file.split
all_numbers_integer = all_numbers.map do |number|
  number.to_i
end
odds, evens = all_numbers_integer.partition do |number|
  number.odd?
end

open('odds.txt', 'w') do |file|
  file.puts "The odd numbers are:"
  file.puts odds.sort
end

open('evens.txt', 'w') do |file|
  file.puts "The even numbers are:"
  file.puts evens.sort
end
