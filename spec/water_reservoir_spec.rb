require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
    it 'has a default capacity of 10' do
        reservoir = WaterReservoir.new
        expect(reservoir.capacity).to eq(10)
    end

    it 'is initially empty' do
        reservoir = WaterReservoir.new
        expect(reservoir.current_water_volume).to eq(0)
    end

    it 'has capacity set by user' do
        reservoir = WaterReservoir.new(100, 0)
        expect(reservoir.capacity).to eq(100)
    end

    it 'has initial volume set by user' do
        reservoir = WaterReservoir.new(100, 50)
        expect(reservoir.current_water_volume).to eq(50)
    end
end
