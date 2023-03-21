require_relative '../lib/chiller'
require_relative '../lib/item'

describe 'A chiller' do
    it 'has a default capacity of 100' do
        chiller = Chiller.new
        expect(chiller.capacity).to eq(100)
    end

    it 'initially is room temperature' do
        chiller = Chiller.new
        expect(chiller.temperature).to eq(Chiller::ROOM_TEMPERATURE)
    end

    it 'initially is off' do
        chiller = Chiller.new
        expect(chiller.power).to eq(:off)
    end

    it 'initially is empty' do
        chiller = Chiller.new
        expect(chiller.contents).to eq([])
    end

    it 'can be turned on' do
        chiller = Chiller.new
        chiller.turn_on
        expect(chiller.power).to eq(:on)
    end

    it 'can be turned off' do
        chiller = Chiller.new
        chiller.turn_on
        chiller.turn_off
        expect(chiller.power).to eq(:off)
    end

    it 'can add item' do
        item = Item.new('Food', 10)
        chiller = Chiller.new
        chiller.add(item)
        expect(chiller.contents).to eq([item])
    end

    it 'correctly reduces capacity by item volume when item is added' do
        item = Item.new('Food', 10)
        chiller = Chiller.new
        chiller.add(item)
        expect(chiller.remaining_capacity).to eq(90)
    end

    it 'can set level' do
        chiller = Chiller.new
        chiller.set_level(3)
        expect(chiller.temperature).to eq(55)
    end
end
