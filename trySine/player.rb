class Player 
	def initialize
		@space_ship = Gosu::Image.new("media/starfighter.bmp", false)
		@x = @y = @vel_x = @vel_y = @angle = @total_time = 0.0
	end

	def warp(x, y)
		@x, @y = x, y
	end

	def accelerate 
		@vel_x += Gosu.offset_x(@angle, 0.5)
		@vel_y += Gosu.offset_y(@angle, 0.5)
	end

	def move
		@x += (800 / 2 ) + Math.sin(@total_time * 0.5)

		@x += @vel_x
		@y += @vel_y
		@x %= 800
		# @y %= 300

		@vel_x *= 0.95
		@vel_y *= 0.95
	end

	def move_left
		@x -= 5
	end

	def move_right
		@x += 5
	end

	def move_down
		@y += 5
	end

	def draw
		@space_ship.draw_rot(@x, @y, 1, 0)
	end

	# def limits 
	# 	if @x <= 100
	# 		puts "test"
	# 	end

	# end

	def update
	end




end