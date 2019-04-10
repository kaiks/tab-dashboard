# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'lists/new', skip: 'not implemented', type: :view do
  before(:each) do
    assign(:list, List.new(
                    title: 'MyString',
                    user_id: 1,
                    position: 1
                  ))
  end

  it 'renders new list form' do
    render

    assert_select 'form[action=?][method=?]', lists_path, 'post' do
      assert_select 'input[name=?]', 'list[title]'

      assert_select 'input[name=?]', 'list[user_id]'

      assert_select 'input[name=?]', 'list[position]'
    end
  end
end
