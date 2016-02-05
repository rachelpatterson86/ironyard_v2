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

## BEWARE THE SEMICOLON!

#require 'pry'
require 'set'

words = ['angus',
         'onomatopeia',
         'mississippi',
         'cookies',
         'terminal',
         'illness',
         'communist',
         'dictator',
         'capitalist',
         'marxist',
         'darwinism']

def finished?(turns, guesses, answer)
  turns.zero? || complete_word?(guesses, answer)
end

def complete_word?(guesses, answer)
  answer.chars.all? { |l| guesses.include?(l) }
end

def greeting
  # TODO: tell the player about hangman
  puts "Welcome to Hangman. You know what to do!"
end

def print_init_word_spaces(ans)
  (ans.length).times do
    print "_ "
  end
  puts ""
end

def game_over(turns,ans)
  if turns.zero?
    puts "Sorry loser."
  else
    puts "You got it. You win!"
  end
  puts "The word was #{ans}. Thanks for playing."
  # TODO: tell the player what the word was and if they won or lost
end

def prompt_player(guessed,turns)
  puts "What letter would you like to guess? You have #{turns} turns left."
  input = gets.chomp.downcase
  if input !~ /[a-z]/ || input.chars.length != 1 || guessed.include?(input)
    input = validate_input(input,guessed)
  end
  input
  # TODO: get user input / show some status
end

def validate_input(input,guessed)
  until /[a-z]/ === input && input.chars.length == 1 && !guessed.include?(input)
    if /[^a-z]/ === input
        puts "#{input} is not a valid letter."
    elsif input.chars.length != 1
        puts "#{input.chars.length} #{input} is not a valid length. One character is only needed."
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
  puts ""
end

def hangman(words)
  turn_count = ARGV.empty? ? 6 : ARGV[0].to_i
  guessed = Set.new
  answer = words.sample
  greeting # TODO: Do I need an argument? -- NOPE
  print_init_word_spaces(answer)
  until finished?(turn_count, guessed, answer)
    guess = prompt_player(guessed,turn_count)
    guessed.add(guess)
    display_partial_word(guessed,answer)
    unless answer.include?(guess)
      turn_count -= 1
    end
  end
  game_over(turn_count, answer) # TODO: Do I need an argument? -- YES
end

hangman(words)