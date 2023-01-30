require 'byebug'

class GraphNode
	attr_accessor :value, :neighbors
	def initialize(value)
	@value = value
	@neighbors = []
	end

	def self.bfs(starting_node, target_value)
		queue = [starting_node]
		visited = []


		while queue.size != 0
			checked = queue.shift
			if checked.value == target_value
				return checked
			else
				checked.neighbors.each { |ele| queue << ele}
				visited << checked
				checked = queue.shift
			end
		end
		nil
	end
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p GraphNode.bfs(a, "f")