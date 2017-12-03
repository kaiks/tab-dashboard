require 'rails_helper'

RSpec.describe "to_do_items/index", type: :view do
  before(:each) do
    assign(:to_do_items, [
      ToDoItem.create!(
        :user_id => 2,
        :content => "Content",
        :done => false,
        :removed => false,
        :description => "MyText"
      ),
      ToDoItem.create!(
        :user_id => 2,
        :content => "Content",
        :done => false,
        :removed => false,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of to_do_items" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
