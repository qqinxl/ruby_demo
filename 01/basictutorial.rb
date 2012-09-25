presidents = ["Ford", "Carter", "Reagan", "Bush1", "Clinton", "Bush2"]
presidents.each {|prez|
	puts prez
}
puts "======================"
my_array = ["alpha", "beta", "gamma"]
puts my_array.collect {
	|word|
	word.capitalize
}
puts "======================"
puts my_array.collect do
	|word|
	word.capitalize
end

a = " Qin xiaolin"

puts a.capitalize
puts a.capitalize!
puts a.center(1)
puts a.chomp
puts a.chomp!
puts a.downcase
puts a.downcase!
puts "======================"
puts a.reverse
#puts a.reverse!
puts a.rindex("o")
puts a.rjust(6)
puts a.strip
puts a.upcase
puts a.upcase!
puts a