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
    xit 'returns true if coordinate is valid' do
      board = Board.new

      expect(board.valid_coordinate?("A1")).to eq(true)
      expect(board.valid_coordinate?("D4")).to eq(true)

    end

    xit 'returns false if coordinate is invalid' do
      board = Board.new

      expect(board.valid_coordinate?("A5")).to eq(false)
      expect(board.valid_coordinate?("E1")).to eq(false)
      expect(board.valid_coordinate?("A22")).to eq(false)
    end
  end

  describe '#valid_placement?' do
    it 'will return false if the placement is invalid' do
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect (board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect (board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end

    xit 'will return true if the placement is valid' do
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    end
  end
end
