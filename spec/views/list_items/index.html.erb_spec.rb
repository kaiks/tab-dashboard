require 'rails_helper'

RSpec.describe 'list_items/index', skip: 'not implemented', type: :view do
  before(:each) do
    assign(:list_items, [
      ListItem.create!(
        :url => 'MyText',
        :read => false,
        :removed => false
      ),
      ListItem.create!(
        :url => 'MyText',
        :read => false,
        :removed => false
      )
    ])
  end

  it "renders a list of list_items" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
