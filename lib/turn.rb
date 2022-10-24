require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/turn'
require './lib/player'

class Turn

  # def comp_ship_placement
    
  # end

  # def start
    
  #   puts "I have laid out my ships on the grid." 
  #   puts "You now need to lay out your two ships."
  #   puts "The Cruiser is three units long and the Submarine is two units long."
  #   computer.place_submarine(submarine, valid_coordinates)
  #   computer.place_cruiser(cruiser, valid_coordinates)

  #   computer.board.render(optional_arg = false) 
  #   puts "Enter the squares for the Cruiser (3 spaces):"
  # end

  def quit
    abort "Abandon ship!"
  end

  def intro
    puts "Welcome to battleship"
    puts "Enter p to play. Enter q to quit"
    if gets.chomp == p
      turn.start
    # elsif gets.chomp == q
    #   turn.quit
    end
  end

  def take_turn
  end
end