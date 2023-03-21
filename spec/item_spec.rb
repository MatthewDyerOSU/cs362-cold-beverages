require_relative '../lib/item'

describe 'An item of food or a beverage' do
    it 'has a name when provided one' do
        item = Item.new('Test Name', 50)
        expect(item.name).to eq('Test Name')
    end

    it 'has a volume when provided one' do
        item = Item.new('Test Name', 50)
        expect(item.volume).to eq(50)
    end
end
