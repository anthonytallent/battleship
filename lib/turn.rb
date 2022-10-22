require './lib/ship'
require './lib/cell'
require './lib/board'

class Turn

  # def comp_ship_placement
    
  # end

  def start
   puts "I have laid out my ships on the grid." 
   puts "You now need to lay out your two ships."
   puts "The Cruiser is three units long and the Submarine is two units long."

   render(optional_arg = false) 
   puts "Enter the squares for the Cruiser (3 spaces):"
  end

  def intro
    puts "Welcome to battleship"
    puts "Enter p to play. Enter q to quit"
    if gets.chomp == p
      start
    elsif gets.chomp == q
      quit
    end
  end
end