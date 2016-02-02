#x is an empty string and a value is added if a certain condition is true.  If
#the string is empty, puts i else x. Then the value of x is reset to an empty
#string. This is simpler to read then added a lot of conditinal statements. x
#evalates to less conditional so the code is proably more efficient compared to
#fizzbuzz_010515.rb file.

def fizz_buzz_fancy (n)
  (1..n).each do |i|
    x = ''
    x += 'Fizz' if i % 3 == 0
    x += 'Buzz' if i % 5 == 0
    puts(x.empty? ? i : x)
  end
end


puts "got arguments: #{ARGV}"
puts "calling fizzbuzz with #{ARGV[0]}"

limit = ARGV[0].to_i
fizz_buzz_fancy(limit)

#NOTE: ARGV v. gets.chomp
# The difference has to do with where the user is required to give input.
# ARGV: If they give your script inputs on the command line.
# gets.chomp: If you want them to input using the keyboard while the script is running.

#Will be using ARGV more when I run files rather than hardcoding a value to test in the file itself.
