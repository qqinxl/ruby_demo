class TaxCalculator
	def initialize(name, &block)
		@name, @block = name, block
	end
	def get_tax(amount)
		"#{@name} on #{amount} = #{@block.call(amount)}"
	end
end

tc = TaxCalculator.new("Sales Tax") {|amt| amt*0.075}

p tc.get_tax(1000)
p tc.get_tax(2000)


a,b,*c = 1,2,3,4,5,6,[7,8,9]

p c


require 'monitor'
class Counter < Monitor
	attr_reader :count
	def initialize
		@count = 0 
		super
	end
	def up
		synchronize do
			@count +=1
		end
	end
	def down
		synchronize do
			@count -=1
		end
	end
end

c = Counter.new

start = Time.now
t1 = Thread.new {100.times {c.up}}
t2 = Thread.new {100.times {c.down}}
p (Time.now - start).to_i

t1.join
t2.join

p c.count

require 'open-uri'

open("http://www.yahoo.co.jp") do |f|
	p f.read.scan(/<img src="(.*?)"/m).uniq
end