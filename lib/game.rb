require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'
require './lib/player'

class Game
  attr_reader :player,
              :computer, 
              :computer_ships_sunk, 
              :player_ships_sunk, 
              :board, 
              :cruiser, 
              :submarine, 
              :coordinates, 
              :player_input, 
              :computer_coord, 
              :fired_upon_coordinates

  def initialize
    @coordinates = []
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
    @player = Player.new
    @computer = Computer.new
    @computer_ships_sunk = 0
    @player_ships_sunk = 0
    @player_input = nil
    @computer_coord = nil
    @fired_upon_coordinates = []
  end

  def render_boards
    puts "\n\n\n=============COMPUTER BOARD============="
    puts computer.board.render(optional_arg = false)
    puts "==============PLAYER BOARD=============="
    puts player.board.render(true)
  end

  def player_shot
    print "\nEnter coordinate for your shot: "
    @player_input = gets.chomp.upcase.split[0]
    until computer.board.valid_coordinate?(@player_input) && !fired_upon_coordinates.include?(@player_input)
      if fired_upon_coordinates.include?(@player_input)
        system("clear")
        render_boards
        puts "\nYou have already shot at this coordinate, don't waste a turn, Dummy!"
        print "Fire another shot at a valid coordinate: "
      elsif !computer.board.valid_coordinate?(@player_input)
        system("clear")
        render_boards
        puts "\nYou have entered an invalid coordinate. Don't waste your turn, Dummy!"
        print "Fire another shot at a valid coordinate: "
      end
    @player_input = gets.chomp.upcase.split[0]
    end
    computer.board.cells[@player_input].fire_upon
    fired_upon_coordinates << @player_input
  end

  def computer_shot
    @computer_coord = player.board.cells.keys.sample
    until player.board.cells[@computer_coord].fired_upon? == false
      @computer_coord = player.board.cells.keys.sample
    end
    player.board.cells[@computer_coord].fire_upon
  end

  def results
    if computer.board.cells[@player_input].render == "X"
      @computer_ships_sunk += 1
      puts "Your shot on #{@player_input} sunk a ship."
    elsif computer.board.cells[@player_input].render == "H"
      puts "Your shot on #{@player_input} was a hit."
    elsif computer.board.cells[@player_input].render == "M"
      puts "Your shot on #{@player_input} was a miss."
    end

    if player.board.cells[@computer_coord].render == "X"
      @player_ships_sunk += 1
      puts "My shot on #{@computer_coord} sunk a ship."
    elsif player.board.cells[@computer_coord].render == "H"
      puts "My shot on #{@computer_coord} was a hit."
    elsif player.board.cells[@computer_coord].render == "M"
      puts "My shot on #{@computer_coord} was a miss."
    end
  end

  def menu
    puts "Welcome to Battleship!"
    print "Enter 'p' to play. Enter 'q' to quit: "
    user_input = gets.chomp.downcase
    if user_input == "p"
      puts "====================================================="
      puts "Here we go!"
      sleep(1)
      system("clear")
    elsif user_input == "q"
      puts "See ya!"
      exit
    elsif
      while(user_input != ("p" || "q"))
        system("clear")
        puts "INVALID INPUT"
        puts "\nWelcome to Battleship!"
        print "Enter 'p' to play or 'q' to quit: "
        user_input = gets.chomp.downcase
          if user_input == ("q")
            puts "See ya!"
            exit
          end
        system("clear")
      end
    end
  end

  def start
    initialize

    menu
    computer.place_cruiser(cruiser, coordinates)
    computer.place_submarine(submarine, coordinates)
  
    puts "I have laid out my ships on the grid." 
    puts "You now need to lay out your two ships.\n\n"
    puts "The Cruiser is three units long and the Submarine is two units long.\n\n"
 
    puts player.board.render(true)
    player.player_place_cruiser
    system("clear")

    puts "I have laid out my ships on the grid." 
    puts "You now need to lay out your two ships.\n\n"
    puts "The Cruiser is three units long and the Submarine is two units long.\n\n"

    puts player.board.render(true)
    player.player_place_submarine
    puts "====================================================="
    system("clear")
    play
  end

  def play
    until @computer_ships_sunk == 2 || @player_ships_sunk == 2
      puts "\n=============COMPUTER BOARD============="
      puts computer.board.render(optional_arg = false)
      puts "==============PLAYER BOARD=============="
      puts player.board.render(true)
      
      player_shot
      computer_shot
      system("clear")
      results
    end
    
    if computer_ships_sunk == 2
      puts "\nYou won!\n\n"
      puts "=============COMPUTER BOARD============="
      puts computer.board.render(optional_arg = false)
      puts "==============PLAYER BOARD=============="
      puts player.board.render(true)
      puts "\n\n"
    elsif player_ships_sunk == 2
      puts "\nI won!\n"
      puts "=============COMPUTER BOARD============="
      puts computer.board.render(optional_arg = false)
      puts "==============PLAYER BOARD=============="
      puts player.board.render(true)
      puts "\n\n"
    end

    start
  end
end
