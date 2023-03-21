require_relative '../lib/freezer'
require_relative '../lib/item'

describe 'A freezer' do
    it 'has a default capacity of 100' do
        freezer = Freezer.new
        expect(freezer.capacity).to eq(100)
    end

    it 'initially is room temperature' do
        freezer = Freezer.new
        expect(freezer.temperature).to eq(Freezer::ROOM_TEMPERATURE)
    end

    it 'initially is off' do
        freezer = Freezer.new
        expect(freezer.power).to eq(:off)
    end

    it 'initially is empty' do
        freezer = Freezer.new
        expect(freezer.contents).to eq([])
    end

    it 'can be turned on' do
        freezer = Freezer.new
        freezer.turn_on
        expect(freezer.power).to eq(:on)
    end

    it 'can be turned off' do
        freezer = Freezer.new
        freezer.turn_on
        freezer.turn_off
        expect(freezer.power).to eq(:off)
    end

    it 'can add item' do
        item = Item.new('Food', 10)
        freezer = Freezer.new
        freezer.add(item)
        expect(freezer.contents).to eq([item])
    end
end
