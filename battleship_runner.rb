require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'
require './lib/player'

# def start

# end
player = Player.new
computer = Computer.new
turn = Turn.new

turn.intro

computer.start
