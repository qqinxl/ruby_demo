puts "Howdy!"
printf("\n\nprintf formats numbers like %7.2f, and strings like %s.\n\n\n", 3.14156, "me")

puts "What is your name?"
$name = STDIN.gets
puts "Hi "+$name

def getCostAndMpg
    cost = 30000  
    mpg = 30
    return cost,mpg
end
a, b = getCostAndMpg
puts "AltimaCost = #{a}, AltimaMpg = #{b}"

class String
    def NullOrEmpty?
    (self == nil || self == "")
    end
end
puts "test".NullOrEmpty?
puts "".NullOrEmpty?


# sample program showing special characters like comments
# I'm a comment line
a = 1  #notice no semicolon and no type declaration
b = 2; c = 3; #notice two statements on one line
name = "Abraham \
Lincoln"   # a line continued by trailing \
puts "#{name}"
=begin
I'm ignored.
So am I.
=end

name="Mike"
puts "hi #{name}"  + '    hi\n #{name}' 
puts "hi\n #{name}" 
$myname="Ishmael"
puts "hi #$myname"  
puts "hi #{$myname}" 
# puts "hi #{myname}" 
puts "hi $myname" 
puts "hi {$myname}" 


i = 0
j = 1
puts "i = #{i}, j=#{j}"
i,j = j,i
puts "i = #{i}, j=#{j}"


mystuff = %w{tivo nokia ipaq}
puts mystuff.length
puts mystuff.last

puts mystuff
puts mystuff.inspect
p mystuff
p mystuff.pop
p mystuff
mystuff.push("x","y","z")
p mystuff.shift
p mystuff

toppings = Hash["pancakes","syrup4444444","Pizza","Pepper","Cereal","Sugar"]
toppings.each{|key, value| 
	puts "#{key} points to #{value}"
}
toppings_selected = toppings.select{|key, value| 
	value.length > 7
}
p toppings_selected

('a'..'g').each{ |letter| puts letter }
('a'...'g').each{ |letter| puts letter }

f=2
puts f=f+2 while f < 10

balance = -10.0
puts "Bankrupt" unless balance > 0.0

n=0 ; max=7
n.upto(max) {|num| puts num}

class Person
  attr_reader :fname, :lname
  def initialize(fname, lname)
   @fname = fname
   @lname = lname   
  end
  def to_s
     "Person: #@fname #@lname"     
  end
end
person = Person.new("a","b")
p person

class Employee < Person
  
  def initialize(fname, lname, position)
    super(fname,lname)
    @position = position
  end
  def to_s
     super + ", #@position"
  end
  def etype
     if @position == "CEO" || @position == "CFO"
         "executive"
     else
         "staff"
     end
  end
  def method_missing(name, *args)
    puts "I don't know the method #{name}: #{args.to_s}"
  end
end
employee = Employee.new("c","d","CEO") 
p employee
p employee.fname  
p person.fname  
p employee.etype  
p employee.xxxx(1,2) 

def whereisit
   yield
   yield
   yield
end
whereisit {puts "where is the money?"}

def cubes(max)
   i=1
   while i < max
      yield i**3
      i += 1
   end
end

cubes(8) { |x| print x, ", "}  
sum = 0
cubes(8) { |y| sum += y}
p "\nsum=" + sum .to_s       


def employee(empId)
      #next 2 lines simulated from calling a database on the empId
      lastname = "Croton"
      firstname = "Milo" 
      yield lastname,firstname  #multiple arguments sent to block
end
employee(4) { |last,first| p "employee : #{first}, #{last}"}

numbers = [1,3,5,7,9,11]
p numbers.detect {|x| x > 5}
p numbers.select {|x| x > 5}
p numbers.collect {|x| x*2}
p numbers.inject({}) { |s,e| s.merge( { e.to_s => e**e } ) }

begin
   file = File.open("test.txt")
   while line = file.gets
      puts line
   end
ensure
   file.close
end

IO.foreach("test.txt") { |line| puts line }

reg = /[^\w\-\.]/;

Dir.foreach(".") { |f| 
  print "testing \"#{f}\""
  if f =~reg  #filename contains something other than letters, numbers, _,-, or .
     puts "\r\n   name with funny characters: #{f}"
     newName = f.gsub(reg,"_")   # \w is any word character, letter,num or _
     if File.exist?(newName)
	puts "   File #{newName} already exists.  Not renaming."
     else
	puts "   renaming #{f} to #{newName}"
	File.rename(f,newName)
     end
  else
    puts "   it's ok."
  end
}

p global_variables
p local_variables
p "this is a test".gsub(/[aeiou]/,'*');

#"one:two:three".each(":"){|x| puts x}

ObjectSpace.each_object(Person) {|s| 
   p s 
} 


require 'test/unit'

class TestMe < Test::Unit::TestCase

  def test_add
    s = 1 + 1
    assert_equal(2, s)
  end

end

require 'open-uri'
open('http://www.google.com', :proxy => "http://proxy01.dev.local:3128"){ |f| print f.read }





__END__
puts "goodbye"