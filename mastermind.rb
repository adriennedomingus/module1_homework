class Mastermind
  attr_reader :sequence, :start_time

  def initialize
    @sequence = []
    4.times do
      @sequence << options.sample
    end
    @start_time = Time.now
  end

  def instructions
    "Here are the instructions"
  end

  def options
    ["R", "G", "B", "Y"]
  end

  def play_game
    guesses = 0
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
    guess = ""
    until guess.upcase == sequence.join
      guess = gets.chomp
      if guess == "c"
        puts sequence.join
      elsif guess.length != 4
        puts "Your guess must contain four letters. Please try again."
      else
        guesses += 1
        puts "Your guess was #{guess.upcase}. This has #{common_elements(guess)} correct elements with #{exact_items(guess)} in the correct place"
      end
    end
    puts "Congratulations! You guessed the sequence #{sequence.join} in #{guesses} guesses over #{minutes} minutes #{seconds} seconds"
  end

  def minutes
    ((start_time - Time.now).abs / 60).floor
  end

  def seconds
    ((start_time - Time.now).abs % 60).to_i
  end

  def exact_items(guess)
    guess = guess.chars.map! { |char| char.upcase }
    counter = 0
    @sequence.each_with_index do |thing, index|
      if thing == guess[index]
        counter += 1
      end
    end
    counter
  end

  def common_elements(guess)
    the_guess = guess.chars.map! { |char| char.upcase }
    counter = 0
    the_sequence = []
    @sequence.each do |thing|
      the_sequence << thing
    end
    the_guess.each do |item|
      if the_sequence.any? { |actual_item| item == actual_item }
        counter += 1
        the_sequence.delete_at(the_sequence.index(item))
      end
    end
    counter
  end
end

if __FILE__ == $0
  mastermind = Mastermind.new
  puts "Welcome to MASTERMIND"
  puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  response = gets.chomp
  if response == "i" || response == "instructions"
    puts mastermind.instructions
  elsif response == "p" || response == "play"
    mastermind.play_game
  else
    puts "I'm not sure what you mean. Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end
end
