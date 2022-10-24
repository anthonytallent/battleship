require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'
require './lib/player'

RSpec.describe 'player class' do
  it '' do
     player = Player.new
     @cruiser = Ship.new("Cruiser", 3)
     @submarine = Ship.new("Submarine", 2)
     @board = Board.new
     player.player_place_cruiser
  end
end