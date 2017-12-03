require 'rails_helper'

RSpec.describe ToDoItem, type: :model do
  before(:each) do
    @user = create(:user)
  end
  it 'can be instantiated' do
    to_do_item = create(:to_do_item, user: @user)
    expect(to_do_item).to be_valid
  end

  it 'sets done_at date automatically' do
    to_do_item = create(:to_do_item, user: @user)
    to_do_item.update(done: true)
    to_do_item.reload
    expect(to_do_item.done_at.to_date).to eq Date.today
  end
end
