require 'gosu'

require_relative './player1.rb'
require_relative './player2.rb'
require_relative './star_class.rb'

class Tutorial < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Tutorial Game"

    @background_image = Gosu::Image.new("media/space.png", :tileable => true)

    @player = Player.new
    @player2 = Player.new
    @player2.warp(400, 200)
    @player.warp(320, 240)
    @playerWins = false
    @player2Wins = false

    @star_anim = Gosu::Image.load_tiles("media/star.png", 25, 25)
    @stars = Array.new

    @font = Gosu::Font.new(20)

    @paused = false
  end

  def pause
    @paused = true

  end

  def un_pause
    @paused = false
  end

  def toggle_pause 
    if @paused
      un_pause
    else
      pause
    end
  end

  def update
    if @paused == false
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
      @player.accelerate
    end
    @player.move
    @player.collect_stars(@stars)

    if rand(100) < 4 and @stars.size < 25
      @stars.push(Star.new(@star_anim))
    end

    if Gosu.button_down? Gosu::KB_W
      @player2.accelerate
    end
    if Gosu.button_down? Gosu::KB_A
      @player2.turn_left
    end
    if Gosu.button_down? Gosu::KB_D
      @player2.turn_right
    end
    @player2.move
    @player2.collect_stars(@stars)

    winCondition
    
  end

  end

  def winCondition 
    if @player.score >= 100
      pause
      @playerWins = true
    end
   if @player2.score >= 100
      pause
      @player2Wins = true
    end
  end

  def draw
    @background_image.draw(0, 0, -1)
    @player.draw
    @player2.draw
    @stars.each { |star| star.draw }
    @font.draw("Score: #{@player.score}", 10, 10, 1, 1.0, 1.0, Gosu::Color::RED)
    @font.draw("Score: #{@player2.score}", 10, 50, 1, 1.0, 1.0, Gosu::Color::BLUE)

    if @playerWins == true
      @font.draw("Player One Wins", 640 / 2, 480 / 2, 1, 1.0, 1.0, Gosu::Color::RED)
    end
    if @player2Wins == true
      @font.draw("Player Two Wins", 640 / 2, 480 / 2, 1, 1.0, 1.0, Gosu::Color::BLUE)
    end

  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end

    if id == Gosu::KB_SPACE
      toggle_pause
    end

  end


end



Tutorial.new.show
