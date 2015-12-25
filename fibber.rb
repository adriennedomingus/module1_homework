# https://github.com/turingschool/challenges/blob/master/fibber.markdown

def fibbonacci(quantity)
  first = 0
  second = 1
  puts first
  puts second
  (quantity - 2).times do
    puts first + second
    second, first = first + second, second
  end
end

puts fibbonacci(25)
