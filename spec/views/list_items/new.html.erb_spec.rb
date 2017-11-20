require 'rails_helper'

RSpec.describe "list_items/new", type: :view do
  before(:each) do
    assign(:list_item, ListItem.new(
      :url => "MyText",
      :read => false,
      :removed => false
    ))
  end

  it "renders new list_item form" do
    render

    assert_select "form[action=?][method=?]", list_items_path, "post" do

      assert_select "textarea[name=?]", "list_item[url]"

      assert_select "input[name=?]", "list_item[read]"

      assert_select "input[name=?]", "list_item[removed]"
    end
  end
end
