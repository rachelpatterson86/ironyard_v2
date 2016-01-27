"Write a program that prints the numbers from 1 to 100. But for multiples of
three print “Fizz” instead of the number and for the multiples of five print
“Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”
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
