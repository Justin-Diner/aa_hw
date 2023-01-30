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

# Class Time
#  		1
#		/\
#	   2  3
#	  /\   /\
#	4	5 6  7

class PolyTreeNode
	def dfs(target)
		return self if self.value == target

		self.children.each do |child|
			result = child.dfs(target)
			return result unless result.nil? 
		end
	nil
	end

	def bfs(target)
		queue = [self] #root node

		until queue.empty?
			node = queue.shift 
			return node if node.value == target
			node.children.each do |child|
				queue << child
			end
		end
	end
end