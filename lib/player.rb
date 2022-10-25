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
        puts "Enter the squares for the Cruiser (3 spaces):"
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

  def player_place_submarine
    puts "Enter the squares for the Submarine (2 spaces):"
    coordinates = false
      until coordinates == true do
        puts "Enter the squares for the Submarine (2 spaces):"
        puts "Example: D1 D2"
        puts "or: C1 D1"
        puts "no comma necessary"
        puts ""
        submarine_coord = gets.chomp.split
          if board.valid_placement?(submarine, submarine_coord) == true
            @board.place(submarine, submarine_coord)
            coordinates = true
          else puts "Those are invalid coordinates. Please try again"
          end
      end
  end

  # def player_shot
  #   computer.board.cells[[gets.chomp]].fire_upon
  # end
end