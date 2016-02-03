# this is a constant
AGE = 30

# Function Definition
def more_fun(x)
  puts i
  if x.class != String
    puts "we'll still use x and do stuff"
  end
  puts "i live inside more_fun"
  puts "i guess it is fun"
end

1.upto(10) do |i|
  more_fun('test')
end

# Function call
more_fun('example')

our_symbol = :test

def fun(x)
  if x.class == String
    age = 30
    puts "okay"
    puts age
  end
  more_fun(our_symbol)
  puts x
end

fun('codes')

# x = 30
# fun(x)
# puts x

# AGE = 29
# if AGE == 28
#   puts "you're handsome"
# end

# puts 'random ruby stuff'
# puts "#{1 + 2}"
