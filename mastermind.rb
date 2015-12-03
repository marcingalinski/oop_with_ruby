colors = %w(blue green red yellow white black)
chosen_colors = Array.new(4) { |i| colors[rand(0...6)] } 
puts chosen_colors.join