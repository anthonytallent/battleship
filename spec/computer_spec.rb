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

  it 'has a cruiser and submarine by default' do
    board = Board.new
    computer = Computer.new
    
    expect(computer.cruiser).to be_a(Ship)
    expect(computer.submarine).to be_a(Ship)
    expect(computer.cruiser.name).to eq("Cruiser")
    expect(computer.submarine.name).to eq("Submarine")
  end

  it 'places its cruiser in valid coordinates' do
    board = Board.new
    computer = Computer.new
    cruiser = Ship.new("Cruiser", 3)
    
    computer.place_cruiser(cruiser, computer.coordinates)

    expect(board.valid_placement?(cruiser, computer.coordinates)).to eq(true)
  end

  it 'places its submarine in valid coordinates' do
    board = Board.new
    computer = Computer.new
    submarine = Ship.new("Submarine", 2)
    
    computer.place_submarine(submarine, computer.coordinates)

    expect(board.valid_placement?(submarine, computer.coordinates)).to eq(true)
  end
end