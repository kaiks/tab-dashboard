# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'to_do_items/new', skip: 'not implemented', type: :view do
  before(:each) do
    assign(:to_do_item, ToDoItem.new(
                          user_id: 1,
                          content: 'MyString',
                          done: false,
                          removed: false,
                          description: 'MyText'
                        ))
  end

  it 'renders new to_do_item form' do
    render

    assert_select 'form[action=?][method=?]', to_do_items_path, 'post' do
      assert_select 'input[name=?]', 'to_do_item[user_id]'

      assert_select 'input[name=?]', 'to_do_item[content]'

      assert_select 'input[name=?]', 'to_do_item[done]'

      assert_select 'input[name=?]', 'to_do_item[removed]'

      assert_select 'textarea[name=?]', 'to_do_item[description]'
    end
  end
end
