f = "First"
l = "Last"

#CONCATENATION
# 1. What code can you write to output the string "FirstLast"?
puts f + l
# 2. What code can you write to output the string "LastFirst"?
puts l + f
# 3. What code can you write to output the string "First Last"?
puts f + " " + l
# 4. What code can you write to output the string "Last First Last First"?
puts l + " " + f+ " " + l + " " + f

#INTERPOLATION
# 1. What code can you write to output the string "FirstLast"?
puts "#{f}#{l}"
# 2. What code can you write to output the string "LastFirst"?
puts "#{l}#{f}"
# 3. What code can you write to output the string "First Last"?
puts "#{f} #{l}"
# 4. What code can you write to output the string "Last First Last First"?
puts "#{l} #{f} #{l} #{f}"

name_1 = "Megan Smith"
name_2 = "Todd Park"

# 1. Can you come up with two ways to output just the fragment "Megan" from name _1?
puts name_1[0..4]
puts name_1[0..-6]
# 2. Would either of your techniques from A work to output "Todd" from name_2? Why or why not?
  #No - their names have different numbers of characters, so the substrings would cut at different points.
# 3. Write code that can out put the initials of name_2
puts name_2[0] + name_2[5]

a = 12
b = 65
c = 31
d = 98

#Write code to find the average of these four numbers
puts (a + b + c + d)/4
#Find the average yourself... is your answer different?
  #Yes, because Ruby automatically used them as floats (rounded), vs. fixnum, which includes decimals.
puts a+b*c/d
puts (a+b)*(c/d)
  #Ruby automatically uses order of operations

e = "Ezra"
f = "Ada"
g = "Yukihiro"
h = "Grace"

#Write code to output both the total characters in all the names together and the average length of the names.
puts e.length + f.length + g.length + h.length
puts (e.length + f.length + g.length + h.length)/4

#HappyBirthday

age = 3
age_times = age - 1

puts "Happy"
age_times.times do
  puts "happy"
end
puts "birthday!"
#puts "birthday!"

#String Compression

word = "Kalamazoo"
compression_length = word.length - 2
puts word[0] + "#{compression_length}" + word[-1]
