class LRUCache
	attr_reader :cache
	def initialize(n)
		@max_length = n 
		@cache = []
	end

	def count
		@cache.length
	end

	def add(el)
		# adds element to cache according to LRU principle
		if count < @max_length
			@cache << el
		else
			@cache.shift
			self.check(el)
		end
	end

	def show
		# shows the items in the cache, with the LRU item first
		p @cache
	end

	private
	def check(el)
		@cache.each do |ele|
			if ele == el
				@cache.delete(ele)
			end
		end
		@cache << el
	end

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]