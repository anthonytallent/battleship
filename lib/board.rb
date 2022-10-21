require './lib/ship'
require './lib/cell'

class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coord)
    @cells.include?(coord)
  end

  def consecutive_numbers(coordinates)
    split_coords = coordinates.map do |coord|
      coord.split("")
    end
    numbers = split_coords.map do |coord|
      coord.last
    end
    if numbers.length == 3 
      if numbers[2].to_i - numbers[0].to_i == 2 && numbers[2].to_i - numbers[1].to_i == 1
        true
      else 
        false
      end
    elsif numbers.length == 2
      if numbers[1].to_i - numbers[0].to_i == 1
        true
      else
        false
      end
    end
  end

  def consecutive_letters(coordinates)
    split_coords = coordinates.map do |coord|
      coord.split("")
    end
    letters = split_coords.map do |coord|
      coord.first
    end
    if letters.length == 3
      if letters[2].ord - letters[1].ord == 1 && letters[2].ord - letters[0].ord == 2
        true
      else
        false
      end
    elsif letters.length == 2
      if letters[1].ord - letters[0].ord == 1
        true
      else
        false
      end
    end
  end

  def same_letter(coordinates)
    coordinates.all? do |coord|
      coordinates.first[0] == coord[0]
    end
  end

  def same_number(coordinates)
    coordinates.all? do |coord|
        coordinates.first[-1] == coord[-1]
    end
  end

  def valid_placement?(ship, coordinates)
    ship.length == coordinates.count &&
    (consecutive_numbers(coordinates) && same_letter(coordinates) ||
    consecutive_letters(coordinates) && same_number(coordinates))
  end
end