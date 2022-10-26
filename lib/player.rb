require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'

class Player
  attr_reader :cruiser, :submarine, :board
  
  def initialize
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
  end

  def player_place_cruiser
    coordinates = false
      until coordinates == true do
        puts "\nEnter the squares for the Cruiser (3 spaces)"
        puts "Example: A1 A2 A3 or A1 B1 C1"
        print "(no comma necessary): "

        cruiser_coord = gets.chomp.upcase.delete(",").split
          if board.valid_placement?(cruiser, cruiser_coord) == true
            @board.place(cruiser, cruiser_coord)
            coordinates = true
          else
            system("clear")
            puts "I have laid out my ships on the grid." 
            puts "You now need to lay out your two ships.\n\n"
            puts "The Cruiser is three units long and the Submarine is two units long.\n\n"
            puts board.render(true) 
            puts "\nTHOSE ARE INVALID COORDINATES. PLEASE TRY AGAIN."
          end
      end
  end

  def player_place_submarine
    coordinates = false
      until coordinates == true do
        puts "\nEnter the squares for the Submarine (2 spaces)"
        puts "Example: D1 D2 or C3 D3"
        print "(no comma necessary): "

        submarine_coord = gets.chomp.upcase.delete(",").split
          if board.valid_placement?(submarine, submarine_coord) == true
            @board.place(submarine, submarine_coord)
            coordinates = true
          else
            system("clear")
            puts "I have laid out my ships on the grid." 
            puts "You now need to lay out your two ships.\n\n"
            puts "The Cruiser is three units long and the Submarine is two units long.\n\n"
            puts board.render(true) 
            puts "\nTHOSE ARE INVALID COORDINATES. PLEASE TRY AGAIN."
          end
      end
  end
end