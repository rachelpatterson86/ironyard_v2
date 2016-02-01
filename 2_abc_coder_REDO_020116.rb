# NATO alphabet transation
# Write your own NATO alphabet. There should be a function to encode and decode.
# The encode function will take a string replace all upper and lower case
# characters with their "NATO" equivalents and return the result. The decode
# function will take a string, replace the "NATO" characters with their normal
# letter form and return that. Non-alphabetical should be copied/stay the same
# in both cases. Hint 1: You will need a hash table.

#NOTE: the main differences between this code and the original code from 1/06/15 is the
#1) testing of nil to ensure than non letters are apart of the encoded/decoded msg.
#2) save the output of the functions in a variable (encode/decode)
#3) def nato_hash - too lazy to manually write the hash table.
#4) I did the rot13 exercise.

nato_arr = ["Alfa",	"Bravo",	"Charlie",	"Delta",	"Echo",	"Foxtrot",	"Golf",
"Hotel",	"India",	"Juliett",	"Kilo",	"Lima",	"Mike",	"November",	"Oscar",
"Papa",	"Quebec",	"Romeo",	"Sierra",	"Tango",	"Uniform",	"Victor",	"Whiskey",
"X-Ray",	"Yankee",	"Zulu"]

#takes in nato_arr and makes a hash table that I can use for the nato_encode and
#nato_decode function.

def nato_hash(nato)
  $nato = {}
  idx = 0
  nato.each do |e|
    $nato[e[idx]] = e.upcase
  end
  $nato
end
nato_hash(nato_arr)

def encoder(msg,nato)
  encode = ""
  msg.each_char do |c|
    nato[c].nil? ? encode << c :  encode << nato[c]
  end
  encode
end

def decoder(msg,nato)
  decode = ""
  msg.split.each do |c|
    nato.invert[c].nil? ? decode << c : decode << nato.invert[c]
  end
  decode
end

nato_hash(nato_arr)
encoder("CAT HAT",$nato)
decoder("TANGO ALFA ; TANGO", $nato)

# BONUS!
# Look at the wikipedia page for ROT-13. Try to write an encoder and decoder for ROT-13.

#laziness again! I didn't feel like writing an alphabet table for the task. I thought it would be
#more fun to make.

#making the rot13 alphabet
abc = ""
rot13 = ""
$nato.each_key do |k|
  abc << k
end
move = abc[0,13]
rot13 = abc.delete(move) + move

text = "bathmat"
text.tr('a-z',rot13)
