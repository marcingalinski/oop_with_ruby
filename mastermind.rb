class Game
	def initialize
		@win = false
		@chosen_colors = choose_colors
		@hint = "Let's try!"
	end

	def play
		greet

		10.times do |i|
			puts "#{10 - i} attempts remaining"
			check_guess
			give_hint
			break if @win
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
		Array.new(4) { |i| colors[rand(0...6)] } 
	end

	def take_guess
		guessed_colors = nil

		until @win
			guessed_colors = gets.chomp.split

			if guessed_colors.each { |color| colors.include? color } && guessed_colors.size == 4
				break			
			else
				puts "Please input 4 colors"
				redo
			end
		end

		guessed_colors
	end

	def check_guess
		guessed = 0
		misplaced = 0
		chosen = [] + @chosen_colors

		take_guess.each_with_index do |color, index|
			if chosen[index] == color
				guessed += 1
				chosen[index] = "match"
			elsif chosen.include? color
				misplaced += 1 
				chosen[chosen.index(color)] = "match"
			end
		end
		
		update_status(guessed, misplaced)
	end

	def update_status(guessed, misplaced)
		if guessed == 4
			@win = true
			@hint = "You guessed all of the colors!"
		elsif misplaced == 0
			@hint = "You guessed #{guessed} colors exactly."
		else		
			@hint = "You guessed #{guessed} colors exactly,\n" \
							"#{misplaced} colors was correct, but misplaced."
		end
	end

	def give_hint
		puts @hint
	end

	def give_result
		puts @win ? "You won!" : "You lost!"
	end
end

game = Game.new
game.play