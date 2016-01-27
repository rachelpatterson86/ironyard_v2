#NUMBER GUESSING GAME
#Create a number guessing game. Game should pick a random number between 1 and
#100 and ask you for a guess. If the guess is less than the number, inform the
#user and let them guess again. If the guess is greater than the number, inform
#the user and let them guess again. If the guess is correct, inform the user.

#Hint 1: Use .to_i to convert user input to a number. What is it by default? Answer: string.

#Hint 2: Use rand(number) to get a random number between 0 and number

#NOTE:
#Legacy code: 1/5/15; not following exact instructions per above comments but
#the code works.
puts "Select any number from 1 to 100!"

answer = rand(101)
guess = ""

while guess != answer do
  guess = gets.to_i
  if !guess.between?(1,100)
    puts "Did you follow directions? That is NOT the input needed. Try again"
  elsif guess > answer
    puts "Guess again! You are no Miss Cleo. That number is too high."
  elsif guess < answer
    puts "That number is too low. Guess again."
  else
    puts "That's awesome. #{answer} was the number! You are psychic."
  end
end
