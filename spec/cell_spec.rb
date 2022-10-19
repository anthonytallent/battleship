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

      expect(cell.ship).to eq(cruiser)
    end
  end

  describe '#empty? method' do
    it 'returns true if cell does not have a ship in it' do
      cruiser = Ship.new("Cruiser", 3)

      cell = Cell.new("B4")

      expect(cell.empty?).to eq(true)
    end


    it 'returns false if cell has a ship in it' do
      cruiser = Ship.new("Cruiser", 3)

      cell = Cell.new("B4")

      cell.place_ship(cruiser)

      expect(cell.empty?).to eq(false)
    end
  end

  describe '#fire_upon method' do
    it 'will fire upon an existing cell' do
      cruiser = Ship.new("Cruiser", 3)

      cell = Cell.new("B4")

      cell.place_ship(cruiser)
      cell.fire_upon

      expect(cell.ship.health).to eq(2)
    end
  end

  describe '#fired_upon method' do
    it 'will return false if it has not been fired upon' do
        cruiser = Ship.new("Cruiser", 3)

        cell = Cell.new("B4")

        cell.place_ship(cruiser)

        expect(cell.fired_upon?).to eq(false)
    end

    it 'will return true if it has been fired upon' do
      cruiser = Ship.new("Cruiser", 3)

      cell = Cell.new("B4")

      cell.place_ship(cruiser)
      cell.fire_upon

      expect(cell.fired_upon?).to eq(true)
    end
  end

  describe '#render method' do
    it 'returns "." if the cell has not had an action performed on it' do

      cell_1 = Cell.new("B4")
      cell_2 = Cell.new("C3")

      expect(cell_1.render).to eq(".")
      expect(cell_2.render).to eq(".")
    end

    it 'returns "M" if the cell is fired upon with no hit' do

      cell_1 = Cell.new("B4")
      cell_2 = Cell.new("C3")

      expect(cell_1.render).to eq(".")
      expect(cell_2.render).to eq(".")

      cell_1.fire_upon

      expect(cell_1.render).to eq("M")
      expect(cell_2.render).to eq(".")
    end

    it 'returns "S" if the cell contains a ship using optional render argument' do

      cruiser = Ship.new("Cruiser", 3)
      
      cell_1 = Cell.new("B4")
      cell_2 = Cell.new("C3")

      expect(cell_1.render).to eq(".")
      expect(cell_2.render).to eq(".")

      cell_1.place_ship(cruiser)

      expect(cell_1.render).to eq(".")
      expect(cell_1.render(true)).to eq("S")
      expect(cell_2.render).to eq(".")
      expect(cell_2.render(true)).to eq(".")

    end

    it 'returns "H" if the cell contains a ship and is hit' do
      cruiser = Ship.new("Cruiser", 3)
      
      cell_1 = Cell.new("B4")
      cell_2 = Cell.new("C3")

      expect(cell_1.render).to eq(".")
      expect(cell_2.render).to eq(".")

      cell_1.place_ship(cruiser)
      cell_1.fire_upon

      expect(cell_1.render).to eq("H")
      expect(cell_2.render).to eq(".")
    end

    it 'returns "X" if the cell contains a sunk ship' do
      cruiser = Ship.new("Cruiser", 3)
      
      cell_1 = Cell.new("B4")
      cell_2 = Cell.new("C3")

      expect(cell_1.render).to eq(".")
      expect(cell_2.render).to eq(".")

      cell_1.place_ship(cruiser)

      cell_1.fire_upon

      expect(cell_1.render).to eq("H")
      expect(cruiser.sunk?).to eq(false)   

      cell_1.fire_upon
      cell_1.fire_upon

      expect(cell_1.render).to eq("X")
      expect(cruiser.sunk?).to eq(true)
    end

  end
end
