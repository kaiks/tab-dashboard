require 'rails_helper'

RSpec.describe "list_items/show", type: :view do
  before(:each) do
    @list_item = assign(:list_item, ListItem.create!(
      :url => "MyText",
      :read => false,
      :removed => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
