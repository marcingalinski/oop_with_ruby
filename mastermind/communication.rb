module Communication

	private

	def greet
		puts "I've chosen four colors between #{colors.join(', ')}.\n" \
				 "You have 10 attempts to guess them. In the right order!"
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

	def give_hint
		puts @hint
	end

	def give_result
		puts @win ? "You won!" : "You lost!"
	end
end