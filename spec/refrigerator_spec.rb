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

    it 'has total capacity equal to capacity of chiller + freezer' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        fridge = Refrigerator.new(chiller, freezer, dispenser, reservoir)
        expect(fridge.total_capacity).to eq(200)
    end

    it 'has total remaining capacity equal to remaing capacity of chiller + freezer' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        fridge = Refrigerator.new(chiller, freezer, dispenser, reservoir)
        expect(fridge.remaining_capacity).to eq((freezer.remaining_capacity) + (chiller.remaining_capacity))
    end

    it 'can be plugged in' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        fridge = Refrigerator.new(chiller, freezer, dispenser, reservoir)
        fridge.plug_in
        expect(fridge.power).to eq(:on)
        expect(chiller.power).to eq(:on)
        expect(freezer.power).to eq(:on)
    end

    it 'can be unplugged' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        fridge = Refrigerator.new(chiller, freezer, dispenser, reservoir)
        fridge.plug_in
        fridge.unplug
        expect(fridge.power).to eq(:off)
        expect(chiller.power).to eq(:off)
        expect(freezer.power).to eq(:off)
    end

    it 'can set chiller level' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        fridge = Refrigerator.new(chiller, freezer, dispenser, reservoir)
        fridge.set_chiller_level(3)
        expect(chiller.temperature).to eq(55)
    end

    it 'can set freezer level' do
        chiller = Chiller.new
        freezer = Freezer.new
        reservoir = WaterReservoir.new
        dispenser = WaterDispenser.new(reservoir)
        fridge = Refrigerator.new(chiller, freezer, dispenser, reservoir)
        fridge.set_freezer_level(3)
        expect(freezer.temperature).to eq(40)
    end
end
