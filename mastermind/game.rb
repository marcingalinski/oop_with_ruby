$LOAD_PATH << '.'
require 'colors.rb'
require 'communication.rb'
require 'gameplay.rb'
require 'ai.rb'

class Game
	include Colors
	include Communication
	include Gameplay
	GameState = Struct.new(:win, :ai, :chosen_colors, :hint, :player)

	def initialize
		@game = GameState.new(false, false, choose_colors, "Let's try!", 'You')
	end

	def play
		ask_game_option
		set_player
		run_game
	end
end