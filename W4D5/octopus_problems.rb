require 'byebug'

oct_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
'fiiiissshhhhhh']

# Sluggish Octopus

def sluggish_octopus(arr) #O(n^2)
	biggest_fish = ""

	(0...arr.length).each do |i|
		(0...arr.length).each do |j|
			if arr[i].length > arr[j].length 
				biggest_fish = arr[i]
			end
		end
	end
	biggest_fish
end

p sluggish_octopus(oct_arr)

def dominant_octopus(oct_arr) #O(n log n)
	return oct_arr if oct_arr.length < 2

	half = oct_arr.length / 2
	left = oct_arr[0...half]
	right = oct_arr[half..-1]

	sorted_left = dominant_octopus(left)
	sorted_right = dominant_octopus(right)
	merge(sorted_left, sorted_right)
end

def merge(left, right)
	sorted = []

	while left.length > 0 && right.length > 0
		if left[0].length < right[0].length
			sorted << left.shift
		else
			sorted << right.shift
		end
	end
		sorted += left += right
end

p dominant_octopus(oct_arr)[-1]

def clever_octopus(oct_arr)
	max_length = oct_arr[0].length
	longest = oct_arr[0]
	
	oct_arr.each_with_index do |ele, idx|
		if ele.length > max_length
			max_length = ele.length
			longest = ele
		end
	end
	longest
end

p clever_octopus(oct_arr)

def slow_dance(move, dance)
	dance.each_with_index do |ele, idx|
		if ele == move
			return idx
		end
	end
end
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up"]

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

def fast_dance(move, dance)
	dance[move]
end

new_tiles_data_structure = 	{
	"up" => 0, 
	"right-up" => 1,
	"right" => 2,
	"right-down" => 3,
	"down" => 4,
	"left-down" => 5,
	"left" => 6,
	"left-up" => 7
}
p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)