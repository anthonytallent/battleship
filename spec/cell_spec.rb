require './lib/cell'

RSpec.describe Cell do
  describe '#Cell class' do
    it 'exists' do
      cell = Cell.new("B4")

      expect(cell).to be_a(Cell)
    end
  end
end
