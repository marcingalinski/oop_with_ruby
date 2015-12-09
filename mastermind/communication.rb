module Communication

	private

	def ask_game_option
		puts "Press enter, if you want to guess.\n" \
				 "If you want me to guess, input four colors from #{colors.join(', ')}."

		get_user_choice
	end

	def get_user_choice
		user_choice = gets.chomp.split  
		@game.ai = input_condition(user_choice)
		if @game.ai
			@ai = AI.new
			@game.chosen_colors = user_choice
		end
	end

	def greet
		if @game.ai
			puts "I'll guess now!"
		else
			puts "I've chosen four colors between #{colors.join(', ')}.\n" \
					 "You have 10 attempts to guess them. In the right order!"
		end
	end

	def take_player_guess
		guessed_colors = gets.chomp.split

		until input_condition(guessed_colors)
			puts "Please input 4 colors"
			guessed_colors = gets.chomp.split
		end

		guessed_colors
	end

	def take_ai_guess
		guess = @ai.guess
		puts guess.join(' ')
		guess
	end

	def input_condition input
		input.each { |color| colors.include? color } && input.size == 4
	end

	def give_hint
		puts @game.hint
	end

	def give_result
		puts @game.win ? "#{@game.player} won!" : "#{@game.player} lost!"
	end
end