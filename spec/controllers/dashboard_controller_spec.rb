# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  login_user
  let(:valid_list_attributes) do
    { title: 'blablabla', user_id: @user.id }
  end

  let(:valid_session) { {} }

  describe 'GET #show' do
    it 'returns a success response' do
      List.create! valid_list_attributes
      get :show, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end
end
