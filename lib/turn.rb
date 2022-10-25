require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'
require './lib/player'

class Turn
  attr_reader :player, :computer, :coordinates, :cruiser, :submarine, :board, :computer_ships_sunk, :player_ships_sunk

  def initialize(player, computer)
    @coordinates = []
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @board = Board.new
    @player = Player.new
    @computer = Computer.new
    @computer_ships_sunk = 0
    @player_ships_sunk = 0
  end

  # def quit
  #   abort "Abandon ship!"
  # end

  # def intro
  #   puts "Welcome to battleship"
  #   puts "Enter p to play. Enter q to quit"
  #   if gets.chomp == p
  #     computer.start
  #   # elsif gets.chomp == q
  #   #   turn.quit
  #   end
  # end

  def player_turn
    
      puts "=============COMPUTER BOARD============="
      puts computer.board.render(optional_arg = false)
      puts "==============PLAYER BOARD=============="
      puts player.board.render(true)
      computer.board.cells[[gets.chomp]].fire_upon
    

    
  end
end