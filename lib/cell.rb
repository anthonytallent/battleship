class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def place_ship(ship)
    if @ship == nil
      @ship = ship
    end
  end
end
