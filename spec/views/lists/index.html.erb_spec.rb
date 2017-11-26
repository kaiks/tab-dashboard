require 'rails_helper'

RSpec.describe "lists/index", skip: 'not implemented', type: :view do
  before(:each) do
    assign(:lists, [
      List.create!(
        :title => "Title",
        :user_id => 2,
        :position => 3
      ),
      List.create!(
        :title => "Title",
        :user_id => 2,
        :position => 3
      )
    ])
  end

  it "renders a list of lists" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
