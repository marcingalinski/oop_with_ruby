module Communication

	private

	def ask_game_option
		puts "Press enter, if you want to guess.\n" \
				 "If you want me to guess, input four colors from #{colors.join(', ')}."

		get_user_choice
	end

	def get_user_choice
		user_choice = gets.chomp.split  
		@ai = input_condition(user_choice)
	end

	def greet
		if @ai
			puts "I'll guess now!"
		else
			puts "I've chosen four colors between #{colors.join(', ')}.\n" \
					 "You have 10 attempts to guess them. In the right order!"
		end
	end

	def take_guess
		@ai ? computer_guess : player_guess
	end

	def  player_guess
		guessed_colors = gets.chomp.split

		until input_condition(guessed_colors)
			puts "Please input 4 colors"
			guessed_colors = gets.chomp.split
		end

		guessed_colors
	end

	def input_condition input
		input.each { |color| colors.include? color } && input.size == 4
	end

	def give_hint
		puts @hint
	end

	def give_result
		puts @win ? "You won!" : "You lost!"
	end
end