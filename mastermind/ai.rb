$LOAD_PATH << '.'
require 'colors.rb'

class AI
	include Colors
	AI = Struct.new(:last_guess, :guessed, :misplaced, :colors_positions, :history)

	def initialize
		@ai = AI.new([], 0, 0, {}, [])
		make_hash @ai.colors_positions
	end
	
	def guess
		@ai.last_guess = choose_guess
	end

	def hint(guessed, misplaced)
		@ai.guessed = guessed
		@ai.misplaced = misplaced
		update_weights
		@ai.history.push @ai.last_guess
	end

	private

	def update_weights
		if guessed_colors == 0
			@ai.last_guess.each do |color|
				@ai.colors_positions[color] = [0, 0, 0, 0]
			end
		elsif @ai.guessed == 0
			@ai.last_guess.each_with_index do |color, index|
				@ai.colors_positions[color].each { |weight| weight *= 1 + @ai.misplaced**2 }
				@ai.colors_positions[color][index] = 0
			end
		# elsif @ai.misplaced == 0
		# 	@ai.last_guess.each_with_index do |color, index|
		# 		@ai.colors_positions[color].each_with_index do |weight, weight_index| 
		# 			weight *= index == weight_index ? 0 : 1 + @ai.misplaced
		# 		end

		# 		@ai.colors_positions[color][index] *= 1 + @ai.guessed
		# 	end
		else
			@ai.last_guess.each_with_index do |color, index|
				@ai.colors_positions[color].each { |weight| weight *= 1 + @ai.misplaced**2 }
				@ai.colors_positions[color][index] *= 1 + @ai.guessed**2
			end
		end
	end

	def guessed_colors
		@ai.guessed + @ai.misplaced
	end

	def choose_guess
		begin
			guess = []

			for position in 0..3
				probable = find_probable(position)
				guess.push(probable[rand(0...probable.size)])
			end
		end while @ai.history.include? guess

		guess
	end

	def find_probable position
		probable = []

		colors.each do |color|
			@ai.colors_positions[color][position].times { probable.push color }
		end

		probable
	end

	def make_hash hash
		colors.each do |color| 
			hash.store(color, Array.new(4, 1))
		end
	end
end	