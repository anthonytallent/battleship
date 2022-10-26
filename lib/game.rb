require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'
require './lib/player'

class Game
  attr_reader :player, :computer, :computer_ships_sunk, :player_ships_sunk, :board, :cruiser, :submarine, :coordinates, :x, :y, :fired_upon_coordinates

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
    @fired_upon_coordinates = []
  end

  def player_shot
    puts "Enter coordinate for your shot:"
    @x = gets.chomp.upcase.split[0]
    until computer.board.valid_coordinate?(@x) && !fired_upon_coordinates.include?(@x)
      if fired_upon_coordinates.include?(@x)
        puts "You have already shot at this coordinate, don't waste a turn, Dummy!"
        puts "Fire another shot at a valid coordinate:"
      elsif !computer.board.valid_coordinate?(@x)
        puts "You have entered an invalid coordinate. Don't waste your turn, Dummy!"
        puts "Fire another shot at a valid coordinate:"
      end
    @x = gets.chomp.upcase.split[0]
    end
    computer.board.cells[@x].fire_upon
    fired_upon_coordinates << @x
  end

  def computer_shot
    @y = player.board.cells.keys.sample
    until player.board.cells[@y].fired_upon? == false
      @y = player.board.cells.keys.sample
    end
    player.board.cells[@y].fire_upon
  end

  def results
    if computer.board.cells[@x].render == "X"
      @computer_ships_sunk += 1
      puts "Your shot on #{@x} sunk a ship."
    elsif computer.board.cells[@x].render == "H"
      puts "Your shot on #{@x} was a hit."
    elsif computer.board.cells[@x].render == "M"
      puts "Your shot on #{@x} was a miss."
    end

    if player.board.cells[@y].render == "X"
      @player_ships_sunk += 1
      puts "My shot on #{@y} sunk a ship."
    elsif player.board.cells[@y].render == "H"
      puts "My shot on #{@y} was a hit."
    elsif player.board.cells[@y].render == "M"
      puts "My shot on #{@y} was a miss."
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

  def start
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
    @fired_upon_coordinates = []

    menu
    computer.place_cruiser(cruiser, coordinates)
    computer.place_submarine(submarine, coordinates)
  
    puts "I have laid out my ships on the grid." 
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
 
    puts player.board.render(true)
    player.player_place_cruiser
    puts player.board.render(true)
    player.player_place_submarine
    puts "====================================================="
    play
  end

  def play
    until @computer_ships_sunk == 2 || @player_ships_sunk == 2
      puts "=============COMPUTER BOARD============="
      puts computer.board.render(optional_arg = false)
      puts "==============PLAYER BOARD=============="
      puts player.board.render(true)
      
      player_shot
      computer_shot
      results
    end
    
    if computer_ships_sunk == 2
      puts "You won!"
      puts "=============COMPUTER BOARD============="
      puts computer.board.render(optional_arg = false)
      puts "==============PLAYER BOARD=============="
      puts player.board.render(true)
    elsif player_ships_sunk == 2
      puts "I won!"
      puts "=============COMPUTER BOARD============="
      puts computer.board.render(optional_arg = false)
      puts "==============PLAYER BOARD=============="
      puts player.board.render(true)
    end

    start
  end
end
