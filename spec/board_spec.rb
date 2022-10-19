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

    xit 'has 16 key/value pairs' do
    end

    xit 'keys point to cell objects' do
    end
  end


end