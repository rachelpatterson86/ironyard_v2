# Number Guessing Game

#instructions:
#Create a number guessing game. Game should pick a random number between 1 and
#100 and ask you for a guess. If the guess is less than the number, inform the
#user and let them guess again. If the guess is greater than the number, inform
#the user and let them guess again. If the guess is correct, inform the user.

#Hint 1: Use .to_i to convert user input to a number. What is it by default?
#Hint 2: Use rand(number) to get a random number between 0 and number.

#Put into a function for readability: completed 1/26/15
def num_guess_game
  puts "Let's play the number guessing game! Guess any number between 1 to 100"
  num = rand(101)
  guess = "" #initialize var for the loop so that guess remains in scope.
    until guess == num
      guess = gets.chomp.to_i
      if !guess.between?(1,100) #for cases where input is a) outside the range and b) not a number.
        puts "That guess was not between 1 to 100. Try again"
      elsif guess < num
        puts "Your guess is too low! Guess again"
      else
        puts "Your guess is too high! Guess again"
      end
    end
  puts "Your guess is correct! Are you psychic?"
end

#Not a function: completed 1/26/15 : (hmwk assignment didn't require use of a
#function since the concept was not learned yet at this point.)
puts "Let's play the number guessing game! Guess any number between 1 to 100"

num = rand(101)
guess = ""

until guess == num
  guess = gets.chomp.to_i
  if !guess.between?(1,100)
    puts "That guess was not between 1 to 100. Try again"
  elsif guess < num
    puts "Your guess is too low! Guess again"
  elsif guess > num
    puts "Your guess is too high! Guess again #{num}"
  else
    puts "Your guess is correct! Are you psychic? #{num}"
  end
end
