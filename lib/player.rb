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

  def player_place_cruiser(coordinates = [])
    if board.valid_placement?(cruiser, coordinates = [gets.chomp]) && board.valid_coordinate?(coordinates = [gets.chomp])
      board.place(cruiser, coordinates = [gets.chomp])
    else puts "Those are invalid coordinates. Please try again"
    end
    binding.pry
  end
end