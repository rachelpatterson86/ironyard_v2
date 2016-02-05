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

require 'pry'
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
  turns.zero? || answer.chars.all? { |l| guesses.include?(l) }
end

def greeting
  # TODO: tell the player about hangman
  puts "Welcome to Hangman! The Bestest game ever!!"
end

def game_over(turns,ans)
  puts "Thanks for playing."
  if turns.zero?
    puts "Sorry loser."
  else
    puts "You got it. You win!"
  end
  puts "The word was #{ans}"
  # TODO: tell the player what the word was and if they won or lost
end

def prompt_player(guessed)
  puts "Guess a letter."
  input = gets.chomp
  until input ~= /[^a-zA-z]/ || input != guessed
    puts "That's not valid silly. Try again."
    input = gets.chomp
  end
  # TODO: get user input / show some status
end

def hangman(words)
  turn_count = ARGV.empty? ? 6 : ARGV[0].to_i
  guessed = Set.new
  answer = words.sample
  greeting # TODO: Do I need an argument? -- NOPE
  until finished?(turn_count, guessed, answer)
    guess = prompt_player(guessed)
    guessed.add(guess)
    unless answer.include?(guess)
      turn_count -= 1
    end
  end
  game_over(turn_count,answer) # TODO: Do I need an argument?
end

hangman(words)
