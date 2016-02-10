require 'readline'
#f = File.new("file class play text.txt")
#g = File.open("file class play text.txt", 'r')
#f = File.open('ascii_hangman.txt','r')
#f = File.new('ascii_hangman.txt','r')
# File.open('ascii_hangman.txt','r') do |f1|
#   while line = f1.gets
#     puts line
#   end
# end
#f.each_line {|l| print l, ' ' }
#f.each_char {|c| print c, ' ' }

#line = IO.readlines('ascii_hangman_status.txt')[4]
#puts "#{line}"
#size?(g)
#size?(f)

def display_ascii_status(turns)
  line = 0
  original_turns = 6
  (original_turns - turns).times do
    line += 8
  end
  start_point = line
  end_point = line + 7
  File.open('ascii_hangman_status.txt','r') do |f1|
    while line.between?(start_point,end_point)#line = f1.gets
      #puts f1.gets
      puts IO.readlines(f1)[line]
      line +=1
    end
  end
end

display_ascii_status 3
#puts IO.readlines('ascii_hangman_status.txt')[0]
