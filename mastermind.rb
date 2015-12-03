class Game
	def initialize
		@win = false	
	end

	def play
		greet

		10.times do |i|
			puts "#{10 - i} attempts remaining"
			check_guess take_guess
			break if @win
			give_hint
		end

		give_result
	end

	private

	def greet
		puts "I've chosen four colors between #{colors.join(', ')}.\n" \
				 "You have 10 attempts to guess them. In the right order!"
	end

	def colors
		colors = %w(blue green red yellow white black)
	end

	def choose_colors
		@chosen_colors = Array.new(4) { |i| colors[rand(0...6)] } 
	end

	def take_guess
		puts "Let's try!"
		gets.chomp.split
	end

	def check_guess guess
		
	end

	def give_hint
		
	end

	def give_result
		puts @win ? "You won!" : "You lost!"
	end
end

game = Game.new
game.play