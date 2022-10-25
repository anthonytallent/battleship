require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'
require './lib/player'

class Turn
  attr_reader :player, :computer

  def initialize(player, computer)
    @player = Player.new
    @computer = Computer.new


  end

  def quit
    abort "Abandon ship!"
  end

  def intro
    puts "Welcome to battleship"
    puts "Enter p to play. Enter q to quit"
    if gets.chomp == p
      computer.start
    # elsif gets.chomp == q
    #   turn.quit
    end
  end

  def take_turn
    # until computer
      puts "=============COMPUTER BOARD============="
      puts computer.board.render(optional_arg = false)
      puts "==============PLAYER BOARD=============="
      puts player.board.render(true)
    # end

    
  end
end