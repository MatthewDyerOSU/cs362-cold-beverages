require_relative '../lib/item'

describe 'An item of food or a beverage' do
    it 'has a name' do
        item = Item.new('Test Name', 50)
        expect(item.name).to eq('Test Name')
    end
end
