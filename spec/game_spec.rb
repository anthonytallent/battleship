require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'
require './lib/player'
require './lib/game'

RSpec.describe do
  it 'exists' do
    game = Game.new

    expect(game).to be_a(Game)
  end

  it 'has a default cruiser and submarine' do
    game = Game.new
    
    expect(game.cruiser).to be_a(Ship)
    expect(game.submarine).to be_a(Ship)
    expect(game.cruiser.name).to eq("Cruiser")
    expect(game.submarine.name).to eq("Submarine")
  end

  it 'has a default Board' do
    game = Game.new

    expect(game.board).to be_a(Board)
    expect(game.board.cells.keys[0]).to eq("A1")
  end

  it 'has a default Player' do
    game = Game.new

    expect(game.player).to be_a(Player)
  end

  it 'has a default Computer' do
    game = Game.new

    expect(game.computer).to be_a(Computer)
  end

  it 'defaults ships sunk counter for both player and computer to 0' do
    game = Game.new

    expect(game.computer_ships_sunk).to eq(0)
    expect(game.player_ships_sunk).to eq(0)
  end
end