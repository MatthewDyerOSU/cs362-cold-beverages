require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'
require_relative '../lib/vessel'

describe 'A water dispenser' do
    it 'has a reservoir' do
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        expect(dispenser.reservoir).to eq(reservoir)
    end

    it 'can dispense' do
        reservoir = WaterReservoir.new(100, 100)
        vessel = Vessel.new('FAKE', 50)
        dispenser = WaterDispenser.new(reservoir)
        dispenser.dispense(vessel)
        expect(reservoir.current_water_volume).to eq(50)
    end
end
