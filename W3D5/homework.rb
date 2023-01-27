# Data Structures
# Abstract Data Types

# Array can implement a set. The set is the underlying abstract data type. 
# Dictionary (Set (key, value), get (value), delete (key))
# Hashmap is a way at implementing a dictionary. 

# ADTs (Abstract Data Types)
# Stack
# Last In First Out
# Stack#push and Stack#pop
# Normally implemented with an Array. Used in recusrsion. Implicit in any recursion algorithm. 
# Properties: push(el), pop, peek, size, empty?

# Queue
# Sequential, First in First Out 
# Queue#Enque #Queue#Deque
# Push				Shift
# Unshift 			Pop
# Other elements: show (don't want to return it), size, empty?

# Tree 
# Binary Tree
# Each node has at most two children. Has a parent child relationship where a child has, at most, 1 parent. 

# Ternary Tree
# Has at most three children. 

# Unary Tree - Linked List
# n-ary tree (polytree) - unlimited.

#		Depth of 3 Binary Tree (deepest Leaf)
# 		1 (root)
#	  /   \
#	 2		3 (subtree) 	(parent)
#   / \     /\
#  4	5  6  7 (leaves)	(children) 

# Tree Traversal
# BFS - Breadth First Search (layer by layer) - (queue) 1, 2, 3, 4, 5, 6, 7
# DFS - Depth First Search (Straight to the bottom) (stack) 1, 2, 4, 5, 3, 6, 7

# In Ruby, the inspect method will show the stack and the properties. We can override it by having an inspect method. When it looks for an inspect method it calls ours first. This overrides self. 

#def inspect
#	"#<Stack:#{self.object_id}>"
#end

# ^ is an example of an inspect method. 

# Do we need a tree class? Root note would give us access to the children and so on. As long as we have the root, we are good to go. We can access the entire tree from the root. 

# Node - The basic unit comprising a tree. Typically holds a value and references to its children. The root node is the tree (and every other node is a sub-tree). Internal nodes vs. Leaf Nodes. 

# Is the root node a leaf node or an internal node? It depends. It can be both depending on whether it has children. 

# Leaves are not internal. Internal nodes do have children and are just one above the root nodes. 

class Node 
	attr_accessor :children
	def initialize(value, children=[])
		@value = value # a
		@children = children #[b, c]
	end
end

d = Node.new('d')
e = Node.new('e')
f = Node.new('f')
g = Node.new('g')
b = Node.new('b', [d, e])
c = Node.new('c', [f, g])
a = Node.new('a', [b, c])

# Algorithm: General Approach and process to problem solving operations (ex. Binary Search)
# Function/Method: Concrete implementation, in a specific language, of an algorithm. (Binary Search in Ruby)

# Breadth-first Search(BFS) - Queue 
# Depth-first Search (DFS) - Stack

# ADT Structure used for Queue: Array
#def BFS(root, target)
	# create queue  - array 
	# add the root node to the queue - [ a - is a node ]
	# loop through the queue until empty 
		# remove the first node of the queue (dequeue) 
		# Check the value of the root node.
			# if target, return it 
			# if not target, add children into queue (push) [b, c]
	# return nil if we make it through the entire tree (loop above) without finding a target. 
#end

#def BFS(root, target)
#	queue = [a]
#	loop iteration 1 (Is queue empty? No)
#	queue = [a]
#	node = a 
#	is a == d ? No
#	add node.children into queue 
	
#	loop iteration 2 (is queue empty? NO)
#		queue = [1, 1]
#		node = b
#		is b == d? No 
#		add node.children into queue 

#	queue = [c,d,e]

#	loop iteration 3 (is queue empty? No)
#		queue = [c,d,e]
#		node = c
#		is c == d? No
#		add node.children into queue 
	
#	queue = [d ,e ,f ,g]

#	loop iteration 3 (is queue empty? No)
#		queue = [d ,e ,f ,g]
#		node = d
#		is d == d? YES!
#		return d node
#end

# Depth First Search


