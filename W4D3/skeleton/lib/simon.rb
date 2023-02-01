require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
		@sequence_length = 1
		@game_over = false
		@seq = []
  end

  def play
		puts "New Game!"
		sleep(1)
		until game_over
			self.take_turn
		end
			self.game_over_message
			self.reset_game
  end

  def take_turn
		if !game_over 
			self.show_sequence
			if self.require_sequence 
				self.round_success_message
				self.sequence_length += 1
			end
		end
  end

  def show_sequence
		sleep(1)
		self.add_random_color
		self.seq.each do |color|
			puts color
			sleep(1)
			system("clear")
		end
		
  end

  def require_sequence
		guess = gets.chomp.split(" ")

		if guess.length != self.seq.length
			self.game_over = true
			return false
		elsif guess != seq
			self.game_over = true
			return false
		end
		true
  end

  def add_random_color
		colors = ["red", "blue", "green", "yellow"]
		seq << colors.sample
  end

  def round_success_message
		p "You got it"
		sleep(1)
		system("clear")
  end

  def game_over_message
		system("clear")
		p "The last added color was: #{self.seq[0]}"
		p "Game Over"
	
  end

  def reset_game
		self.sequence_length = 1
		self.game_over = false
		self.seq = []
		"New Game!"
		self.play
  end
end
