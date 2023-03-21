require_relative '../lib/refrigerator'
require_relative '../lib/chiller'
require_relative '../lib/freezer'
require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'
require_relative '../lib/item'


describe 'A refrigerator' do
    it 'has a chiller, freezer, dispenser, and reservoir' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        fridge = Refrigerator.new(chiller, freezer, dispenser, reservoir)
        expect(fridge.chiller).to eq(chiller)
        expect(fridge.freezer).to eq(freezer)
        expect(fridge.water_dispenser).to eq(dispenser)
        expect(fridge.water_reservoir).to eq(reservoir)
    end

    it 'is initially off' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        fridge = Refrigerator.new(chiller, freezer, dispenser, reservoir)
        expect(fridge.power).to eq(:off)
    end

    it 'can chill an item' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        fridge = Refrigerator.new(chiller, freezer, dispenser, reservoir)
        item = Item.new('Food', 10)
        fridge.chill(item)
        expect(chiller.contents).to eq([item])
    end

    it 'can freeze an item' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        fridge = Refrigerator.new(chiller, freezer, dispenser, reservoir)
        item = Item.new('Food', 10)
        fridge.freeze(item)
        expect(freezer.contents).to eq([item])
    end
end
