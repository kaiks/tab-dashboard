# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ListItemsHelper. For example:
#
# describe ListItemsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ListItemsHelper, type: :helper do
  it 'sets appropriate class when very old' do
    list_item = build(:list_item, created_at: Date.today - (ListItem::VERY_OLD_DAYS + 1))
    expect(list_item_row_class(list_item)).to eq 'table-danger'
  end

  it 'sets appropriate class when old' do
    list_item = build(:list_item, created_at: Date.today - (ListItem::OLD_DAYS + 1))
    expect(list_item_row_class(list_item)).to eq 'table-warning'
  end

  it 'sets appropriate class when read' do
    list_item = build(:list_item, read: true)
    expect(list_item_row_class(list_item)).to eq 'table-success'
  end

  it 'sets appropriate class when fresh' do
    list_item = build(:list_item, created_at: Time.now)
    expect(list_item_row_class(list_item)).to eq 'table-none'
  end
end
