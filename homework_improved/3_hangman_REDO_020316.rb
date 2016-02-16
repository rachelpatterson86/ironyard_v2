#hmwk:
# Flesh out the Hangman program we started in class.
# Complete any TODOs to add:
  # A greeting for the user.
  # A prompt that tells the user the partially completed word. It may also do
    # input validation (make sure they give a letter) or state the number of
    # remaining turns.
  # A game over state that tells the player if they won or lost and tells them
    # the word they were trying to guess.

# BONUS: Prompt the player to play another game and continue until they quit.
# BONUS: ASCII art everywhere! ASCII logo, ASCII hangman status!

require 'set'

def finished?(turns, guesses, answer)
  turns.zero? || complete_word?(guesses, answer)
end

def complete_word?(guesses, answer)
  answer.chars.all? { |l| guesses.include?(l) }
end

def display_logo
  File.open('ascii_hangman_logo.txt','r') do |f1|
    while line = f1.gets
      puts line
    end
  end
end

def greeting
  puts "Welcome to Hangman. You know what to do!"
end

def print_init_word_spaces(ans)
  puts "\n"
  (ans.length).times do
    print "_ "
  end
  puts "\n\n"
end

def game_over(turns,ans)
  if turns.zero?
    display_ascii_status(turns)
    puts "Sorry loser."
  else
    puts "You got it. You win!"
  end
  puts "The word was #{ans}. Thanks for playing."
end

def prompt_player(guessed,turns)
  puts "What letter would you like to guess? You have #{turns} turns left."
  input = gets.chomp.downcase
  if input !~ /[a-z]/ || input.chars.length != 1 || guessed.include?(input)
    input = validate_input(input,guessed)
  end
  input
end

#added this fuction b/c it's easy to fat finger input. Function runs only
#if any of the following are true:
#a: input is not a letter
#b: input length is more than 1 character long
#c: if the input has already been guessed

def validate_input(input,guessed)
  until /[a-z]/ === input && input.chars.length == 1 && !guessed.include?(input)
    if /[^a-z]/ === input
      puts "#{input} is not a valid letter."
    elsif input.chars.length != 1
      puts "'#{input}' is too long. One character is only needed."
    end
    if guessed.include?(input)
      puts "#{input} is has already been guessed."
    end
    puts "Try again."
    input = gets.chomp.downcase
  end
  input
end

def display_partial_word(guesses,answer)
  answer.each_char do |c|
    if guesses.include?(c)
      print c
    else
      print '_'
    end
    print " "
  end
  puts "\n\n"
end

def display_ascii_status(turns)
  line = 0
  original_turns = 6
  (original_turns - turns).times do
    line += 8
  end
  start_point = line
  end_point = line + 7
  File.open('ascii_hangman_status.txt','r') do |f1|
    while line.between?(start_point,end_point)
      puts IO.readlines(f1)[line]
      line +=1
    end
  end
end

def word
  words = []
  File.open('english-dict.txt','r').each do |f|
    words << f.delete!("\n")
  end
  words.sample
end

def hangman
  turn_count = ARGV.empty? ? 6 : ARGV[0].to_i
  guessed = Set.new
  answer = word
  display_logo
  greeting
  print_init_word_spaces(answer)
  until finished?(turn_count, guessed, answer)
    guess = prompt_player(guessed,turn_count)
    guessed.add(guess)
    display_ascii_status(turn_count)
    display_partial_word(guessed,answer)
    unless answer.include?(guess)
      turn_count -= 1
    end
  end
  game_over(turn_count, answer)
  play_again?
end

def play_again?
  puts "Would you like to play again? Y/N"
  input = gets.chomp.upcase
  input == "Y" ? play_game : (puts "Ok. Next time.")
end

def play_game
  hangman
end

play_game
