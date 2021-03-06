module Gameplay

	private

	def set_player
		@game.player = @game.ai ? 'Computer' : 'You'
	end

	def run_game
		greet

		10.times do |i|
			puts "#{10 - i} attempts remaining"
			check_guess
			give_hint
			break if @game.win
		end

		give_result
	end

	def check_guess
		guessed = 0
		misplaced = 0
		chosen = Array.new(@game.chosen_colors)
		guess = Array.new(take_guess)
		
		guess.each_with_index do |color, index|
		 	if chosen[index] == color
				guessed += 1
				chosen[index] = 'x'
				guess[index] = 'y'
			end
		end

		guess.each_with_index do |color, index|
		 	if chosen.include? color
				misplaced += 1 
				chosen[chosen.index(color)] = 'x'
				guess[index] = 'y'
			end
		end

		update_status(guessed, misplaced)
		hint_ai(guessed, misplaced) if @game.ai
	end

	def take_guess
		@game.ai ? take_ai_guess : take_player_guess
	end

	def update_status(guessed, misplaced)
		if guessed == 4
			@game.win = true
			@game.hint = "#{@game.player} guessed all of the colors!"
		elsif misplaced == 0
			@game.hint = "#{@game.player} guessed #{guessed} colors exactly."
		else		
			@game.hint = "#{@game.player} guessed #{guessed} colors exactly,\n" \
									 "#{misplaced} colors was correct, but misplaced."
		end
	end
end