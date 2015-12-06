require 'pry'

#https://github.com/turingschool/lesson_plans/blob/master/ruby_01-object_oriented_programming_with_ruby/problems_solutions_algorithms.markdown

#COMMON WORDS
#1. How will you know when the problem is solved?
  #When a text document is uploaded, and a list of the three most commonly used words is returned.
#2. How do you want to use the software?
  #Upload a text document. Have three words returned in a new text document
#3. What is the most trivial possible use case?
  #An empty text document is uploaded, and an the returned list is an empty text document
#4. What is the minimum-work case?
  #A text document containing only three unique words is uploaded, the returned text document contains those three words
#5. What is the next-most-complex case?
  #A text document containing four different words with various quantities, but three clearly more
#6. Sketch an algorithm (pseudocode)
  #1. Upload text document
  #2. Read text document
  #3. Create collection of all words in text document
  #4. Count the number of times each word appears
  #5. Return a collection with three most common words
  #6. Save three most common words to new text document
#7. Implement it
#8. Is the whole problem solved? If not, return to 5
#9. Anticipate edge cases
  #Edge cases might include:
    #If a word is misspelled, it would be counted separately
    #This version is not case sensitive. If case mattered, first step could be removed.
    #What if there is a tie for the third word, etc.?
#10. Refactor

file = File.read("common_words.txt")

all_words = file.split

lowercase_words = all_words.map do |word|
  word.downcase
end

word_count = lowercase_words.inject(Hash.new(0)) do |h, i|
  h[i] +=1; h
end.to_a

ordered_word_count = word_count.sort_by do |x, y|
  y
end.reverse

open('common_words.txt', 'a') do |file|
  file.puts "\nThe three most commonly used words in this text are:"
  file.puts ordered_word_count[0][0]
  file.puts ordered_word_count[1][0]
  file.puts ordered_word_count[2][0]
end
