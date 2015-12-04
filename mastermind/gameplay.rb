module Gameplay

	private

	def run_game
		10.times do |i|
			puts "#{10 - i} attempts remaining"
			check_guess
			give_hint
			break if @win
		end
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
end