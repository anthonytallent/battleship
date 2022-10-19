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


end
