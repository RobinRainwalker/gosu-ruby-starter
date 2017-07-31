require 'gosu'

class Camera
  attr_accessor :x, :y, :zoom

  def initialize(target)
    @target = target
    @x, @y = target.x, target.y
    @zoom = 1
  end

    def update
    shift = Game.adjust_speed(@target.speed)
    @x += shift if @x < @target.x - $window.width / 4
    @x -= shift if @x > @target.x + $window.width / 4
    @y += shift if @y < @target.y - $window.height / 4
    @y -= shift if @y > @target.y + $window.height / 4
	end

	def viewport
    x0 = @x - ($window.width / 2)  / @zoom
    x1 = @x + ($window.width / 2)  / @zoom
    y0 = @y - ($window.height / 2) / @zoom
    y1 = @y + ($window.height / 2) / @zoom
    [x0, x1, y0, y1]
  end

 end