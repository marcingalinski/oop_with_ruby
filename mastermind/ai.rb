$LOAD_PATH << '.'
require 'colors.rb'

class AI
	include Colors
	AI = Struct.new(:last_guess, :guessed, :misplaced, :colors_weights)

	def initialize
		@ai = AI.new([], 0, 0, {})
		make_pts_hash
	end
	
	def guess
		choose_probable
	end

	def hint(guessed, misplaced)
		@ai.guessed = guessed
		@ai.misplaced = misplaced
		add_points
	end

	private

	def make_pts_hash
		colors.each { |color| @ai.colors_weights.store(color, 0) }
	end

	def add_points
		@ai.last_guess.each do |color|
			puts "#{@ai.colors_weights[color]} #{color}"
			@ai.colors_weights[color] += guessed_colors
		end
	end

	def guessed_colors
		@ai.guessed + @ai.misplaced
	end

	def choose_probable
		chosen_probable = []
		probables = find_probable

		4.times do
			chosen_probable.push(probables[rand(0...probables.size)])
		end

		chosen_probable
	end

	def find_probable
		probable_colors = colors

		colors.each do |color|
			(@ai.colors_weights[color] ** 2).times do
				probable_colors.push color
			end
		end

		probable_colors
	end
end