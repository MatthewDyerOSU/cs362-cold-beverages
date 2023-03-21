require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
    it 'has a default capacity of 10' do
        reservoir = WaterReservoir.new
        expect(reservoir.capacity).to eq(10)
    end
end
