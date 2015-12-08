$LOAD_PATH << '.'
require 'colors.rb'
require 'communication.rb'
require 'gameplay.rb'
require 'ai.rb'

class Game
	include Colors
	include Communication
	include Gameplay
	include AI

	def initialize
		@win = false
		@ai = false
		@chosen_colors = choose_colors
		@hint = "Let's try!"
		@player = "You"
	end

	def play
		ask_game_option
		set_player
		run_game
	end
end