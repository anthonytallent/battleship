require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'

RSpec.describe do
  it 'exists' do
    board = Board.new
    computer = Computer.new
    expect(computer).to be_a(Computer)
  end

  it 'will place its cruiser in valid coordinates' do
    board = Board.new
    computer = Computer.new
    cruiser = Ship.new("Cruiser", 3)
    
    computer.place_cruiser(cruiser, computer.coordinates)
    binding.pry
    expect(board.valid_placement?(cruiser, computer.coordinates)).to eq(true)
  end

  it 'will place its submarine in valid coordinates' do
    board = Board.new
    computer = Computer.new
    submarine = Ship.new("Submarine", 2)
    
    computer.place_submarine(submarine, computer.coordinates)

    expect(board.valid_placement?(submarine, computer.coordinates)).to eq(true)
  end
end
