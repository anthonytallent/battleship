require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'
require './lib/player'
require './lib/game'

# cruiser = Ship.new("Cruiser", 3)
# submarine = Ship.new("Submarine", 2)
# board = Board.new
player = Player.new
computer = Computer.new
game = Game.new
# turn = Turn.new(player, computer)

game.start

# def start

# end
# player = Player.new
# computer = Computer.new
# turn = Turn.new

# turn.intro

# computer.start

# player.player_place_cruiser

# player.player_place_submarine

# turn.take_turn