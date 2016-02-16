# "Write a program that prints the numbers from 1 to 100. But for multiples of
# three print “Fizz” instead of the number and for the multiples of five print
# “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”

def fizzbuzz (num)
  1.upto(num) do |i|
    if i % 15 == 0
      puts "FizzBuzz"
    elsif i % 5 == 0
      puts "Buzz"
    elsif i % 3 == 0
    puts "Fizz"
    else
      puts "#{i}"
    end
  end
end

fizzbuzz 100
