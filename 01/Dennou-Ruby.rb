#http://ruby.gfd-dennou.org/tutorial/gokuraku/
puts "-----------------------"
a = 2
b = 3.5
c = "apple"


puts a.class
puts b.class
puts c.class

puts a.size
# puts b.size
# Dennou-Ruby.rb:13:in `<main>': undefined method `size' for 3.5:Float (NoMethodError)
puts c.size

d = a * ( b**2 + 3.0e2 )
e = c + "orange"

puts d
puts e

g = b.to_s
h = b.to_i
i = a.to_f/3
j = a/3
m = a.to_f/3 - a/3

puts g
puts h
puts i
puts j
puts m
puts "-----------------------"
ary1 = [ 3, b, d-3.0, "orange"]

puts ary1[0]
puts ary1[1..3]
puts ary1[-1]
puts ary1[-2]

ary2 = [a, ary1]
puts ary2[1][-1]

ary1.each { |d|
	puts "#{d} -> array"
}

puts d
puts Math::PI
puts "-----------------------"
loop do 
	break if STDIN.gets == "\n"
end
puts "-----------------------"


require "date"
sakki = DateTime.new(2003,10,6,21,1,59) 
puts sakki

ima = DateTime.now
puts ima

itsuka = DateTime.parse("2003-10-05")
puts itsuka

puts itsuka.year
puts (itsuka + 2).day
puts (itsuka - 2).day

puts (sakki - itsuka)

puts (sakki >> 1).to_s
puts (sakki + 31).to_s

puts sakki.strftime("%Y")
puts sakki.strftime("%M")
puts sakki.strftime("%D")
puts sakki.strftime("%H:%M")
puts sakki.strftime("%S")
puts sakki.strftime("%y/%m/%d %h:%m:%s")
puts "-----------------------"
f_name = 'Ruby_in_Twenty_Minutes.rb'

file1 = File.open(f_name, "r")
a = file1.gets
puts a
for i in 1..10
	print file1.gets
end
puts "-----------------------"
puts file1.read(20)
puts "-----------------------"
file1.close
open(f_name, 'a') { |f|
  f.puts "#Hello, world."
}
puts "-----------------------"
