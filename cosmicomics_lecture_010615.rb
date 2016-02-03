#require 'pry'

def has_joiner?(word1, word2)
  word1[-1] == word2[0]
end

def is_anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

def is_funny_word?(word1, word2)
  is_anagram?(word1, word2) && has_joiner?(word1, word2)
end

def build_dictionary
  result = Hash.new([])
  File.open('english-dict.txt', 'r') do |f|
    f.each_line do |l|
      word = l.chomp
      result[word.length] += [word] if word.length > 1
    end
  end
  result
end

def cosmicomics
  dict = build_dictionary
  dict.each do |length, words|
    words.combination(2) do |word1, word2|
      puts word1[0, length-1] + word2 if is_funny_word?(word1, word2)
    end
  end
end

cosmicomics

#thoughts

#result[word.length] += [word] if word.length > 1

# before I reviewed the code this year, I was contemplating the most efficient
# data structure to solve this puzzle. I know that I should use a hash table
# where either the key or value represented the length of the word.
# This ensures that when we check for is_funny_word, we are only testing words
# with the same character length. However, I didn't think to make the key, the 
# character length and the value an array of all the words that have that same
# character length. Using the assignment operator, += makes it easier to code
# since all the words with the same char length is associated to one key.

# def is_funny_word?(word1, word2)
#   is_anagram?(word1, word2) && has_joiner?(word1, word2)
# end
#
# If you validate for has_joiner?() before is_anagram?(), the code runs faster since
# the code does not have to sort every time to validate, which takes up more time.
