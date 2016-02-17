# toy = [1, 2, 3, 4]

toy = (1..20).to_a

toy.combination(2) do |x1,x2|
  puts [x1,x2]
end

## Performance
#
# 1. The order at which things grow is the thing that really matter.
# -- The growth we want to track is steps taken by the CPU or memory used.
#
# 2. Benchmarking is hard
# -- You have to account for variance between runs.
# -- You have to know what's actually going on inside the machine.
#    (And/or) your programming language and compiler
# 3. Finding the slow part of a program should always be done with a profiler
# -- It will tell you what functions are being called a lot
#    which is *WAYYYY* more important than what functions are slow
#    and only called a little.
# 4. There are two ways to make a program faster:
# -- 1. Speed up the work that has to be done.
# -- 2. (the vastly better way) Do less work.
# ## Worst-Case
# First thing in the array. If we look for it with 'find',
# then we only have to look once, in the first box.
# O(1), right?
# WRONG! Big O and Algorithmic Analysis is about the
# worst case! Searching through an array for a
# specific element is **linear**. O(n) operation
# due to the worst-case even if you get lucky and
# your item is in the first position in the array.

## Constant Time - O(1)
toy = [1, 2, 3, 4]
toy[2]
  #assigning var, booleans

## Linear Time - O(n)
toy = [1, 2, 3, 4]
toy.find(3)
toy.reverse

## Logarithmic Time O(lg n)

## ruby .sort ie binary tree b/c every time the code looks through a set, it halves the amount.

## Quadratic Time O(n^2) -- pretty slow but can still do some real world stuff
  ## This can extend to 3x loops [O(n^3)], 4x loops [O(n^4)] etc...
#times tables (5)

arr = [1,2,3,4,5]
arr1 = [1,2,3,4,5]
arr.each do |x|
  arr1.each do |y|
    print "#{x*y}" + " "
  end
  puts ""
end

## Exponential Time O(x^n)
## recursion.

def Fibonacci(number)
  number if (number <= 1)
  return Fibonacci(number - 2) + Fibonacci(number - 1)
end
