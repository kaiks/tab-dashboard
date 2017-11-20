require 'rails_helper'

RSpec.describe "list_items/edit", type: :view do
  before(:each) do
    @list_item = assign(:list_item, ListItem.create!(
      :url => "MyText",
      :read => false,
      :removed => false
    ))
  end

  it "renders the edit list_item form" do
    render

    assert_select "form[action=?][method=?]", list_item_path(@list_item), "post" do

      assert_select "textarea[name=?]", "list_item[url]"

      assert_select "input[name=?]", "list_item[read]"

      assert_select "input[name=?]", "list_item[removed]"
    end
  end
end
