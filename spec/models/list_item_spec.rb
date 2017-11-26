require 'rails_helper'

RSpec.describe ListItem, type: :model do
  before(:each) do
    user = create(:user)
    @list = create(:list, user: user)
  end
  it 'adds http to url' do
    list_item = create(:list_item, list: @list)
    expect(list_item.url).to eq 'http://www.example.com'
  end

  it 'adds website title as description' do
    list_item = create(:list_item, list: @list)
    expect(list_item.description).to eq "Example Domain"
  end
end
