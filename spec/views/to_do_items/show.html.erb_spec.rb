require 'rails_helper'

RSpec.describe "to_do_items/show", skip: 'not implemented', type: :view do
  before(:each) do
    @to_do_item = assign(:to_do_item, ToDoItem.create!(
      :user_id => 2,
      :content => "Content",
      :done => false,
      :removed => false,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
  end
end
