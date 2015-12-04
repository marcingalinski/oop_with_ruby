module Colors

	private

	def colors
		colors = %w(blue green red yellow white black)
	end

	def choose_colors
		Array.new(4) { |i| colors[rand(0...6)] } 
	end
end