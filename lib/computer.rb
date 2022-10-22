require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'

class Computer
  attr_reader :cruiser, :submarine, :board, :coordinates
  attr_accessor :cruiser, :submarine, :board, :coordinates

  def initialize
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
    @coordinates = []
  end

  def place_cruiser(cruiser, valid_coordinates)
      until board.valid_placement?(cruiser, valid_coordinates)
          if board.valid_placement?(cruiser, valid_coordinates)
          else valid_coordinates = []
          end
        valid_coordinates = []
        valid_coordinates << board.cells.keys.sample
        valid_coordinates << board.cells.keys.sample
        valid_coordinates << board.cells.keys.sample
      end
    @coordinates = valid_coordinates
    board.place(cruiser, valid_coordinates)
  end

  def place_submarine(submarine, valid_coordinates)
    until board.valid_placement?(submarine, valid_coordinates)
        if board.valid_placement?(submarine, valid_coordinates)
          computer.board.place(submarine, valid_coordinates)
        else valid_coordinates = []
        end
      valid_coordinates = []
      valid_coordinates << board.cells.keys.sample
      valid_coordinates << board.cells.keys.sample
    end
  @coordinates = valid_coordinates
  board.place(cruiser, valid_coordinates)
end
end

