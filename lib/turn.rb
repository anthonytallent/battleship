require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require 'pry'

class Turn
  attr_reader :computer
  attr_accessor :computer
  def initialize
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @ships = [@cruiser, @submarine]
    @player = []
    @computer = []
  end

  def intro
    puts "Welcome to battleship"
    puts "Enter p to play. Enter q to quit"
    if gets.chomp == "p"
      start
    elsif gets.chomp == "q"
      quit
    end
  end

  def start
    computer_place_ships
    render_both_boards
  end

  def render_both_boards
    puts '=============COMPUTER BOARD============='
    puts @computer.board.render
    # puts '==============PLAYER BOARD=============='
    # puts @player.render(true)
  end

  def computer_place_ships
    @computer = Computer.new
    @computer.place_cruiser(@cruiser) # Wrong number of arguments
    @computer.place_submarine(@submarine)
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    # player_place_ships - define method for player to place ships
  end

  binding.pry
end