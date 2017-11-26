require 'rails_helper'

RSpec.describe "lists/show", skip: 'not implemented', type: :view do
  before(:each) do
    @list = assign(:list, List.create!(
      :title => "Title",
      :user_id => 2,
      :position => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
