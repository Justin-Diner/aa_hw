# Stack

class Stack #LIFO
	def initialize
		# create ivar to store stack here!
		@i = []
	end

	def push(el)
		@i << el
	end

	def pop
		@i.pop
	end

	def peek
		@i[-1]
	end
end

stackz = Stack.new

p stackz.push(1)
p stackz.push(2)
p stackz.push(3)
p stackz.push(4)

p stackz.pop
p stackz.peek

class Queue #FIFO
	def initialize 
		@line = []
	end

	def enqueue(el)
		@line.unshift(el)
	end

	def dequeue
		@line.pop
		@line
	end

	def peek
		@line[-1]
	end
end

puts 'Queue'
queuesss = Queue.new
p queuesss.enqueue(1)
p queuesss.enqueue(2)
p queuesss.enqueue(3)
p queuesss.enqueue(4)

p queuesss.dequeue
p queuesss.dequeue
p queuesss.peek

puts
puts "Map"

class Map
	attr_reader :map
	def initialize
		@map = []
	end

	def set(key, value)
		if !@map.any? { |subArr| subArr == [key, value]}
				@map << [key, value]
		else
			puts "Failure!"
		end
	end

	def get(key)
		@map.each do |ele|
			if ele[0] == key
				return ele[1]
			end
		end
	end

	def delete(key)
		@map.each_with_index do |ele, idx|
			if ele[0] == key
				@map.delete_at(idx)
			end
		end
	end

	def show
		p @map
	end
end

setz = Map.new
p setz.set("a", 1)
p setz.set("b", 2)
p setz.set("a", 1)
setz.show

p setz.get("a")
