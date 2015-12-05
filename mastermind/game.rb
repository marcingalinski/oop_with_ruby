$LOAD_PATH << '.'
require 'colors.rb'
require 'communication.rb'
require 'gameplay.rb'

class Game
	include Colors
	include Communication
	include Gameplay

	def initialize
		@win = false
		@chosen_colors = choose_colors
		@hint = "Let's try!"
	end

	def play
		ask_game_option
		greet
		run_game
		give_result
	end
end