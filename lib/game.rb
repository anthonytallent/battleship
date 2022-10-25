require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'
require './lib/player'

class Game
  attr_reader :player, :computer, :computer_ships_sunk, :player_ships_sunk, :board, :cruiser, :submarine, :coordinates, :x, :y

  def initialize
    @coordinates = []
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
    @player = Player.new
    @computer = Computer.new
    @computer_ships_sunk = 0
    @player_ships_sunk = 0
    @x
    @y

  end

  def player_shot
    puts "Enter coordinate for your shot:"
    @x = gets.chomp.split[0]
    computer.board.cells[@x].fire_upon
  end

  def computer_shot
    @y = player.board.cells.keys.sample
    until player.board.cells[@y].fired_upon? == false
      @y = player.board.cells.keys.sample
    end
    player.board.cells[@y].fire_upon
    binding.pry
  end

  def results
    if computer.board.cells[@x].render == "X"
      puts "Your shot on #{@x} sunk a ship."
    elsif computer.board.cells[@x].render == "H"
      puts "Your shot on #{@x} was a hit."
    elsif computer.board.cells[@x].render == "M"
      puts "Your shot on #{@x} was a miss."
    end
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
    binding.pry
    puts "I have laid out my ships on the grid." 
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    # binding.pry
    puts player.board.render(true)
    player.player_place_cruiser
    puts player.board.render(true)
    player.player_place_submarine
    puts "====================================================="
    play
  end

  def play
  
      # turn = Turn.new(player, computer)
      puts "=============COMPUTER BOARD============="
      puts computer.board.render(optional_arg = false)
      puts "==============PLAYER BOARD=============="
      puts player.board.render(true)
      # binding.pry
      # computer.board.cells[gets.chomp].fire_upon
      player_shot
      #binding.pry
      computer_shot
      #binding.pry
      results
      binding.pry

  end


end
