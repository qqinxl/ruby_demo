def h 
	puts "Hello world"
end

h


def h(name = "QQ")
	puts "Hello world again #{name} '#{name}'"
	puts "Hello world again #{@name} '#{@name}'"
	puts 'Hello world again #{name}'
	puts 'Hello world again #{@name}'
end

h("test")


class Gretter 
	def initialize(name = "QQ") 
		@name = name
	end
	
	def say_hi 
		puts "Hi #{@name}!"
	end
	
	def say_bye 
		puts "Bye #{@name}, come back soon."
	end
end

g = Gretter.new()

g.say_hi
g.say_bye

g = Gretter.new("Peter")
g.say_hi
g.say_bye

puts Gretter.instance_methods(false)
puts Gretter.respond_to?("say_hi")

g.to_s


class MegaGreeter
  attr_accessor :names

  def initialize(names = "QQ")
    @names = names
  end

  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end

  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end

end


mg = MegaGreeter.new
mg.say_hi
mg.say_bye


mg.names = "Zeke"
mg.say_hi
mg.say_bye


mg.names = ["Albert", "Brenda", "Charles",
"Dave", "Englebert"]
mg.say_hi
mg.say_bye


mg.names = nil
mg.say_hi
mg.say_bye

#Hello, world.
#Hello, world.
#Hello, world.
