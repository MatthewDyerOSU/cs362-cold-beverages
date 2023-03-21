require_relative '../lib/freezer'

describe 'A freezer' do
    it 'has a default capacity of 100' do
        freezer = Freezer.new
        expect(freezer.capacity).to eq(100)
    end

    it 'initially is room temperature' do
        freezer = Freezer.new
        expect(freezer.temperature).to eq(Freezer::ROOM_TEMPERATURE)
    end
end
