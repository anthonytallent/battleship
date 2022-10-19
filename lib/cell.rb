require './lib/ship'

class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon =  false
  end

  def place_ship(ship)
    if @ship == nil
      @ship = ship
    end
  end

  def empty?
    @ship.nil?
  end

  def fire_upon
    if @ship != nil
      ship.hit
    end

    @fired_upon = true
  end

  def fired_upon?
    return @fired_upon
  end

  def render(optional_arg = false)
    if @ship && @ship.sunk?
      "X"
    elsif optional_arg && @ship
      "S"
    elsif @fired_upon && @ship
      "H"
    elsif @fired_upon && !@ship
      "M"
    else
      "."
    end
  end

end
