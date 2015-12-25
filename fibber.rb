# https://github.com/turingschool/challenges/blob/master/fibber.markdown

def fibbonacci(quantity)
  sequence = []
  first = 0
  second = 1
  sequence << first.to_s + " "
  sequence << second.to_s + " "
  (quantity - 2).times do
    sequence << (first + second).to_s + " "
    second, first = first + second, second
  end
  sequence = output(sequence)
  sequence.join
end

def output(sequence)
  n = 5
  while n < sequence.length
    sequence.insert(n, "\n")
    n += 6
  end
  sequence
end

puts fibbonacci(25)
