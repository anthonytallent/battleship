require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'

class Player
  attr_reader :cruiser, :submarine, :board
  attr_accessor :cruiser, :submarine, :board
  def initialize
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
  end

  def player_place_cruiser
    coordinates = false
      until coordinates == true do
        puts "Example: A1 A2 A3"
        puts "or: A1 B1 C1"
        puts "no comma necessary"
        puts ""
        cruiser_coord = gets.chomp.split
          if board.valid_placement?(cruiser, cruiser_coord) == true
            @board.place(cruiser, cruiser_coord)
            coordinates = true
          else puts "Those are invalid coordinates. Please try again"
          end
      end
  end
end