require 'rails_helper'

RSpec.describe ToDoItem, type: :model do
  before(:each) do
    @user = create(:user)
  end
  it 'can be instantiated' do
    to_do_item = build(:to_do_item, user: @user)
    expect(to_do_item).to be_valid
  end

  it 'autolinks content' do
    to_do_item = create(:to_do_item, user: @user, content: 'ha ha www.google.com')
    expect(to_do_item.content).to eq "ha ha <a href=\"http://www.google.com\">www.google.com</a>"
  end

  it 'sets done_at date automatically' do
    to_do_item = create(:to_do_item, user: @user)
    to_do_item.update(done: true)
    to_do_item.reload
    expect(to_do_item.done_at.to_date).to eq Date.today
  end

  it 'doesnt allow creating stuff with deadline older than now' do
    to_do_item = build(:to_do_item, user: @user, deadline: Date.yesterday)
    expect(to_do_item).not_to be_valid
  end

  it 'doesnt allow creating stuff with valid_from < deadline' do
    to_do_item = build(:to_do_item, user: @user, valid_from: Date.today, deadline: Date.today-1)
    expect(to_do_item).not_to be_valid
  end
end
