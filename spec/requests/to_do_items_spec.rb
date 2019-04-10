# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ToDoItems', type: :request do
  before(:each) do
    user = create(:user)
    sign_in user
  end

  describe 'GET /to_do_items' do
    it 'works! (now write some real specs)' do
      get to_do_items_path
      expect(response).to have_http_status(200)
    end
  end
end
