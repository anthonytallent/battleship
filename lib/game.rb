require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'
require './lib/player'

class Game
  attr_reader :player, :computer, :computer_ships_sunk, :player_ships_sunk, :board, :cruiser, :submarine, :coordinates

  def initialize
    @coordinates = []
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
    @player = Player.new
    @computer = Computer.new
    @computer_ships_sunk = 0
    @player_ships_sunk = 0

  end

  def menu
    puts "Welcome to battleship"
    puts "Enter p to play. Enter q to quit"
    user_input = gets.chomp.downcase
    if user_input == "p"
      puts "====================================================="
      puts "Here we go!"
    elsif user_input == "q"
      puts "See ya!"
    exit
    else user_input != "p" || "q"
      puts "Invalid input. Enter p to play or q to quit."
      start
    end
  end
  # binding.pry
  def start
    # binding.pry
    menu
    computer.place_cruiser(cruiser, coordinates)
    computer.place_submarine(submarine, coordinates)
    puts "I have laid out my ships on the grid." 
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    binding.pry
    puts player.board.render(true)
    player.player_place_cruiser
    puts player.board.render(true)
    player.player_place_submarine
    puts "====================================================="
    play
  end

  def play
  
      turn = Turn.new(player, computer)
      binding.pry
      computer.board.keys[gets.chomp].fire_upon
    

  end
end
