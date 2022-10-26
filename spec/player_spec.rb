require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/turn'
require './lib/player'

RSpec.describe do
  it 'exists' do
    board = Board.new
    player = Player.new

    expect(player).to be_a(Player)
  end

  it 'has a cruiser and submarine by default' do
    board = Board.new
    player = Player.new
    
    expect(player.cruiser).to be_a(Ship)
    expect(player.submarine).to be_a(Ship)
    expect(player.cruiser.name).to eq("Cruiser")
    expect(player.submarine.name).to eq("Submarine")
  end
end