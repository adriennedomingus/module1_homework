for num in 0..1000
  if num % 3 == 0 && num % 5 == 0 && num % 7 == 0
    puts "SuperFizzBuzz"
  elsif num % 3 == 0 && num % 7 == 0
    puts "SuperFizz"
  elsif num % 5 == 0 && num % 7 == 0
    puts "SuperBuzz"
  elsif num % 3 == 0
    puts "Fizz"
  elsif num % 5 == 0
    puts "Buzz"
  elsif num % 7 == 0
    puts "Super"
  else
    puts num
  end
end
