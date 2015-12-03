class Game
	def initialize
		@board = Board.new
		@curr_symbol = "X"
	end

	def play
		9.times do
			@board.show
			win? ? break : make_turn
		end
		@board.show
		invert_symbol
		give_result
	end

	private

	def make_turn
		@board.set(get_field, @curr_symbol)
		invert_symbol
	end

	def invert_symbol
		@curr_symbol == "X" ? @curr_symbol = "O" : @curr_symbol = "X"
	end

	def win?
		win = false
		val = @board.fields

		winning_patterns = [[val[0], val[1], val[2]], [val[3], val[4], val[5]], [val[6], val[7], val[8]],
												[val[0], val[3], val[6]], [val[1], val[4], val[7]], [val[2], val[5], val[8]],
												[val[0], val[4], val[8]], [val[2], val[4], val[6]]]

		winning_patterns.each do |pattern_values|
			win = true if [["X", "X", "X"], ["O", "O", "O"]].include? pattern_values
		end

		win
	end

	def give_result
		puts win? ? "#{@curr_symbol} wins!" : "It's a draw!"
	end

	def get_field
		field = nil
		until (0...9).include? field 
			puts "Where do you want to put #{@curr_symbol}?"
			field = gets.chomp.to_i - 1
			unless @board.fields[field] == " "
				puts "Please input number of any unoccupied field"
				redo
			end
		end
		field
	end
end

class Board
	def initialize
		@fields = Array.new(9, " ")
	end
	
	def show
		puts "1: #{@fields[0]} 2: #{@fields[1]} 3: #{@fields[2]}\n" \
				 " ----|----|----\n" \
				 "4: #{@fields[3]} 5: #{@fields[4]} 6: #{@fields[5]}\n" \
				 " ----|----|----\n" \
				 "7: #{@fields[6]} 8: #{@fields[7]} 9: #{@fields[8]}\n" \
	end

	def set(field, value)
		@fields[field] = value
	end

	def fields
		@fields
	end
end

game = Game.new
game.play