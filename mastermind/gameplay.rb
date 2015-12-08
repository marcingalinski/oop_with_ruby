module Gameplay

	private

	def set_player
		@player = @ai ? "Computer" : "You"
	end

	def run_game
		greet

		10.times do |i|
			puts "#{10 - i} attempts remaining"
			check_guess
			give_hint
			break if @win
		end

		give_result
	end

	def check_guess
		guessed = 0
		misplaced = 0
		chosen = [] + @chosen_colors
		guess = take_guess
		
		guess.each_with_index do |color, index|
		 	if chosen[index] == color
				guessed += 1
				chosen[index] = "match"
			end
		end

		guess.each_with_index do |color, index|
		 	if chosen.include? color
				misplaced += 1 
				chosen[chosen.index(color)] = "match"
			end
		end

		puts guess.join(' ') if @ai
		update_status(guessed, misplaced)
	end

	def take_guess
		@ai ? take_ai_guess : take_player_guess
	end

	def update_status(guessed, misplaced)
		if guessed == 4
			@win = true
			@hint = "#{@player} guessed all of the colors!"
		elsif misplaced == 0
			@hint = "#{@player} guessed #{guessed} colors exactly."
		else		
			@hint = "#{@player} guessed #{guessed} colors exactly,\n" \
							"#{misplaced} colors was correct, but misplaced."
		end
	end
end