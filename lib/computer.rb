require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'
require './lib/player'

class Computer
  attr_reader :cruiser, :submarine, :board
  attr_accessor :cruiser, :submarine, :board 

  def initialize
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
    # @coordinates = []
  end

  def place_cruiser(cruiser, coordinates)
    valid_coordinates = []
      until board.valid_placement?(cruiser, valid_coordinates)
        valid_coordinates = []
        valid_coordinates << board.cells.keys.sample
        valid_coordinates << board.cells.keys.sample
        valid_coordinates << board.cells.keys.sample
        @coordinates = valid_coordinates
      end
     board.place(cruiser, valid_coordinates)
  end

  def place_submarine(submarine, coordinates)
    valid_coordinates = []
      until board.valid_placement?(submarine, valid_coordinates)
        valid_coordinates = []
        valid_coordinates << board.cells.keys.sample
        valid_coordinates << board.cells.keys.sample
        @coordinates = valid_coordinates
      end
    board.place(submarine, valid_coordinates)
  end

  def start
    puts "I have laid out my ships on the grid." 
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    place_submarine(submarine, coordinates)
    place_cruiser(cruiser, coordinates)
  end
end