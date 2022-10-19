require './lib/cell'

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
end
