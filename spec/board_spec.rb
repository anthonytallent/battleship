require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  describe '#Board class' do
    it 'exists' do
      board = Board.new

      expect(board).to be_a(Board)
    end
  end

  describe '#cells method' do
    it 'returns a hash' do
      board = Board.new

      expect(board.cells).to be_a(Hash)
    end

    it 'has 16 key/value pairs' do
      board = Board.new

      expect(board.cells.keys.length).to eq(16)
      expect(board.cells.values.length).to eq(16)
    end

    it 'keys point to cell objects' do
      board = Board.new

      expect(board.cells.values[0]).to be_a(Cell)
    end
  end

  describe '#valid_coordinate? method' do
    it 'returns true if coordinate is valid' do
      board = Board.new

      expect(board.valid_coordinate?("A1")).to eq(true)
      expect(board.valid_coordinate?("D4")).to eq(true)

    end

    it 'returns false if coordinate is invalid' do
      board = Board.new

      expect(board.valid_coordinate?("A5")).to eq(false)
      expect(board.valid_coordinate?("E1")).to eq(false)
      expect(board.valid_coordinate?("A22")).to eq(false)
      expect(board.valid_coordinate?(" ")).to eq(false)
      expect(board.valid_coordinate?(5)).to eq(false)
      expect(board.valid_coordinate?(false)).to eq(false)
      expect(board.valid_coordinate?(true)).to eq(false)
    end
  end

  describe '#valid_placement?' do
    it 'will return false if the coordinates are not equal to the ship length' do
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
      
    end

    it 'will return false if the coordinates are not consecutive' do
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end

    it 'will return false if it is trying to place ship diagonally' do
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      
      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end

    it 'will return true if the placement is valid' do
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    end
  end
  
  describe 'ship placement' do
    it 'returns true if ship is placed in consecutive cells' do
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])

      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]

      expect(cell_1.ship).to eq(cruiser)
      expect(cell_2.ship).to eq(cruiser)
      expect(cell_3.ship).to eq(cruiser)
      expect(cell_3.ship == cell_2.ship).to eq(true)
    end
  end

  describe 'overlapping ships' do
    it 'tests if ships overlap (occupy the same cell)' do
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      board.place(cruiser, ["A1", "A2", "A3"])

      expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
    end 
  end

  describe '#render method for the board' do
    it 'renders the board' do
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])
      
      expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
      expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end

    it 'renders hits on the board' do
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])

      board.cells["A2"].fire_upon
      
      expect(board.render).to eq("  1 2 3 4 \nA . H . . \nB . . . . \nC . . . . \nD . . . . \n")
      expect(board.render(true)).to eq("  1 2 3 4 \nA S H S . \nB . . . . \nC . . . . \nD . . . . \n")
    end

    it 'renders misses on the board' do
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])

      board.cells["C1"].fire_upon
      board.cells["D1"].fire_upon
      board.cells["D4"].fire_upon
      
      expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC M . . . \nD M . . M \n")
      expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC M . . . \nD M . . M \n")
    end

    it 'renders sunk ships on the board' do
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])

      board.cells["A1"].fire_upon
      board.cells["A2"].fire_upon
      board.cells["A3"].fire_upon
      
      expect(board.render).to eq("  1 2 3 4 \nA X X X . \nB . . . . \nC . . . . \nD . . . . \n")
      expect(board.render(true)).to eq("  1 2 3 4 \nA X X X . \nB . . . . \nC . . . . \nD . . . . \n")
    end

    it 'renders misses, hits, and sunk ships on the board' do
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      board.place(cruiser, ["A1", "A2", "A3"])
      board.place(submarine, ["B1", "B2"])

      board.cells["A1"].fire_upon
      board.cells["A2"].fire_upon
      board.cells["A3"].fire_upon
      board.cells["B1"].fire_upon
      board.cells["C1"].fire_upon

      expect(board.render).to eq("  1 2 3 4 \nA X X X . \nB H . . . \nC M . . . \nD . . . . \n")
      expect(board.render(true)).to eq("  1 2 3 4 \nA X X X . \nB H S . . \nC M . . . \nD . . . . \n")
    end
  end
end