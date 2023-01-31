class Board
  attr_accessor :cups

  def initialize(name1, name2)
		@cups = Array.new(14) { Array.new([]) }
		self.place_stones
  end

  def place_stones
		self.cups.each_with_index do |subArr, idx|
			if idx != 6 && idx != 13
				4.times {|num| @cups[idx] << :stone}
			end
		end
  end

  def valid_move?(start_pos)
		if start_pos > 14
			raise "Invalid starting cup"
		end

		if @cups[start_pos - 1].empty?
			raise "Starting cup is empty"
		end
  end

  def make_move(start_pos, current_player_name)
		amount = @cups[start_pos].length 
		@cups[start_pos] = []

		while amount > 0
			@cups[start_pos + 1] << :stone
			amount -= 1
			start_pos = (start_pos % 14) + 1
		end
		self.render

		next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
			:prompt
		elsif @cups[ending_cup_idx].count == 1
			:switch
		else
		ending_cup_idx
		end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
		@cups.take(6).all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
		player1_total = @cups[6].length
    player2_total = @cups[13].length

    if player1_total == player2_total
      :draw
		elsif player1_total > player2_total
      	return @name1 
		else
			return @name2
    end
  end
end
