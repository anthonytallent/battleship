# require 'pry'
# require './lib/ship'
# require './lib/cell'
# require './lib/board'
# require './lib/computer'
# require './lib/player'
# require './lib/game'

#           Turn class was buggy, put all methods in game class

# class Turn
#   attr_reader :player, :computer, :coordinates, :cruiser, :submarine, :board, :computer_ships_sunk, :player_ships_sunk, :x, :y

#   def initialize(player, computer)
#     # @coordinates = []
#     @x
#     @y
#     @cruiser = Ship.new("Cruiser", 3)
#     @submarine = Ship.new("Submarine", 2)
#     @board = Board.new
#     @player = Player.new
#     @computer = Computer.new
#     @computer_ships_sunk = 0
#     @player_ships_sunk = 0
#   end

#   # def quit
#   #   abort "Abandon ship!"
#   # end

#   # def intro
#   #   puts "Welcome to battleship"
#   #   puts "Enter p to play. Enter q to quit"
#   #   if gets.chomp == p
#   #     computer.start
#   #   # elsif gets.chomp == q
#   #   #   turn.quit
#   #   end
#   # end

  

#   # def player_shot
#   #   puts "Enter coordinate for your shot:"
#   #   @x = gets.chomp.split[0]
#   #   computer.board.cells[@x].fire_upon
#   # end

#   # def computer_shot
#   #   @y = player.board.cells.keys.sample
#   #   until player.board.cells[@y].fired_upon? == false
#   #     @y = player.board.cells.keys.sample
#   #   end
#   #   player.board.cells[@y].fire_upon
#   #   binding.pry
#   # end

#   # def results
#   #   if computer.board.cells[@x].render == "X"
#   #     puts "Your shot on #{@x} sunk a ship."
#   #   elsif computer.board.cells[@x].render == "H"
#   #     puts "Your shot on #{@x} was a hit."
#   #   elsif computer.board.cells[@x].render == "M"
#   #     puts "Your shot on #{@x} was a miss."
#   #   end
#   # end
# end