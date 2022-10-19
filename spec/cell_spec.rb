require './lib/cell'
require './lib/ship'

RSpec.describe Cell do
  describe '#Cell class' do
    it 'exists' do
      cell = Cell.new("B4")

      expect(cell).to be_a(Cell)
    end
      cell = Cell.new("B4")

    it 'has a coordinate' do
      cell = Cell.new("B4")

      expect(cell.coordinate).to eq("B4")
    end

    it 'can contain a ship' do
      cell = Cell.new("B4")

      expect(cell.ship).to eq(nil)
    end
  end

  describe '#place_ship method' do
    it 'will place a ship in a cell' do
      cruiser = Ship.new("Cruiser", 3)

      cell = Cell.new("B4")

      cell.place_ship(cruiser)
require 'pry' ; binding.pry
      expect(cell.ship).to eq(cruiser)
    end
  end

  describe '#fired_upon? method' do
    it 'will tell you false if the cell is not fired on yet' do
      cruiser = Ship.new("Cruiser", 3)

      cell = Cell.new("B4")

      cell.place_ship(cruiser)
      cell.fired_upon?
      expect(cell.fired_upon?).to eq(false)
    end
  end
end
