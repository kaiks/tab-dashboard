require 'rails_helper'

RSpec.describe ListItem, type: :model do
  it 'adds http to url' do
    list_item = create(:list_item)
    expect(list_item.url).to eq 'http://www.example.com'
  end

  it 'adds website title as description' do
    list_item = create(:list_item)
    expect(list_item.description).to eq "Example Domain"
  end
end
