ready_to_quit = false
puts "HEY KID!"
input = gets.chomp
@goodbye_count = 0
until ready_to_quit
  if input == ""
    puts "WHAT?!"
    input = gets.chomp
  elsif input == "GOODBYE"
    @goodbye_count += 1
    if @goodbye_count < 2
      puts "LEAVING SO SOON?"
      input = gets.chomp
    elsif @goodbye_count == 2
      puts "LATER, SKATER!"
      ready_to_quit = true
    end
  elsif input != input.upcase
    puts "SPEAK UP, KID!"
    input = gets.chomp
  elsif input == input.upcase
    puts "NO, NOT SINCE 1946!"
    input = gets.chomp
  end
end
