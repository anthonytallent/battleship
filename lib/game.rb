require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'
require './lib/player'

class Game

  def initialize(player, computer)
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

  def start
    menu
    puts "I have laid out my ships on the grid." 
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    place_submarine(submarine, coordinates)
    place_cruiser(cruiser, coordinates)"
  end
end
