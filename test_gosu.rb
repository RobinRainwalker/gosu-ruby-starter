require 'gosu'
# require_relative './window_class.rb'




class GameWindow < Gosu::Window

	def initialize width, height, fullscreen
		super(width, height, fullscreen)
		@sprite = Gosu::Image.new("./test_game/media/starfighter.bmp", false)
		@background = Gosu::Image.new(self, "./test_game/media/space_background.jpeg")
		@x = 800 / 2
		@y = 600 / 2
		@total_time = 0
	end

	def draw
		@sprite.draw(@x, @y, 0 )
		@background.draw(0,0,-1)
	end 
		
	def update
		@total_time += 16.0
		@x = (800 / 2 ) + Math.sin(@total_time * 0.005) * 100
	end

end

class Sprite 
	
end

game_window = GameWindow.new(800, 600, false)

game_window.show


