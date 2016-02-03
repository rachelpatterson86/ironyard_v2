f = File.new("file class play text.txt")
g = File.open("file class play text.txt", 'r')
f.each_line {|l| print l, ' ' }
#f.each_char {|c| print c, ' ' }

g.readlines[0]
size?(g)
size?(f)
