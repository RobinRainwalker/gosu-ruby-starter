require 'gosu'
require_relative './player.rb'
require_relative './camera.rb'

class Window < Gosu::Window
	def initialize
		super 800, 600
		self.caption = "Group Project 3.5"
		@background_image = Gosu::Image.new("media/space_background.jpeg", :tileable => true)
		@total_time = 0
		@player = Player.new
		@player.warp(400, 450)
		# @camera = Camera.new()

	end

	def draw
		@background_image.draw(0, 0, -1)
		@player.draw
	end

	def update
		# @player.limits
		if Gosu.button_down? Gosu::KB_UP
			@player.accelerate
		end
		if Gosu.button_down? Gosu::KB_LEFT
			@player.move_left
		end
		if Gosu.button_down? Gosu::KB_RIGHT
			@player.move_right
		end
		if Gosu.button_down? Gosu::KB_DOWN
			@player.move_down
		end
		@player.move
		# @camera.update

	end

	def button_down(id)
		if id == Gosu::KB_ESCAPE
			close
		else
			super
		end
	end

end

game_window = Window.new
game_window.show