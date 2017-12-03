require 'rails_helper'

RSpec.describe "to_do_items/edit", type: :view do
  before(:each) do
    @to_do_item = assign(:to_do_item, ToDoItem.create!(
      :user_id => 1,
      :content => "MyString",
      :done => false,
      :removed => false,
      :description => "MyText"
    ))
  end

  it "renders the edit to_do_item form" do
    render

    assert_select "form[action=?][method=?]", to_do_item_path(@to_do_item), "post" do

      assert_select "input[name=?]", "to_do_item[user_id]"

      assert_select "input[name=?]", "to_do_item[content]"

      assert_select "input[name=?]", "to_do_item[done]"

      assert_select "input[name=?]", "to_do_item[removed]"

      assert_select "textarea[name=?]", "to_do_item[description]"
    end
  end
end
