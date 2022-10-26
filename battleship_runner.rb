require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'
require './lib/player'
require './lib/game'

player = Player.new
computer = Computer.new
game = Game.new

game.start