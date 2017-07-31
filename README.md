# gosu-ruby-starter
# GOSU
 
GOSU is a ruby gem used for 2D game development. It's a library for Ruby and C++. It's mainly used to teach or learn Ruby.
GOSU provides:  
* A game window
* 2D graphics and text
* Sound in various formats
* Keyboard, mouse, and gamepad input
## Installation Instructions: ##
You need to first have Ruby installed and then install the following:
*  brew install sdl2 (you may or may not need this first step, you can first try to just install the gem)
*  gem install gosu
Then create a new file:
```require 'gosu'
class MyWindow < Gosu::Window
  def initialize
    super 640, 480
    self.caption = 'Hello World!'
  end
  def update
  	// this is where updates to the display should be put, movement, collision detection, etc.
  end
  def draw
  // this is where displayed content is put
  end
end
window = MyWindow.new
window.show
```
This class will provide all the basic functionality for creating a game including the window, timing intervals, the show method which creates a modal application where the window is receiving calls to update, show in addition to many other methods.
## Technologies Used: ##
* Ruby
* GOSU

## Technologies that pair with Gosu ##
* rmagik
* chipmunk

## Links for tuturials ##
  https://www.libgosu.org/cpp/class_gosu_1_1_window.html
  https://github.com/gosu/gosu/wiki/ruby-tutorial
  http://dreamingechoes.github.io/game/gosu/ruby/become-a-videogame-developer-master-with-gosu-and-ruby/ 
  https://github.com/SpencerCDixon/Gosu-Tutorial/blob/master/readme.md#start 
  https://github.com/masonhale/Starfighter-Gosu-Tutorialg 
