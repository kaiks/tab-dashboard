# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe ListsController, type: :controller do
  login_user
  # This should return the minimal set of attributes required to create a valid
  # List. As you add validations to List, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { title: 'blablabla', user_id: @user.id }
  end

  let(:list) { create(:list, user: @user) }
  let(:other_user) { create(:user) }
  let(:other_list) { create(:list, user: other_user) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ListsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: list.to_param }, session: valid_session
      expect(response).to be_successful
    end

    it "returns unauthorized when trying to access other user's list" do
      get :show, params: { id: other_list.to_param }, session: valid_session
      expect(response).to be_unauthorized
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: list.to_param }, session: valid_session
      expect(response).to be_successful
    end

    it "returns unauthorized when trying to access other user's list" do
      get :edit, params: { id: other_list.to_param }, session: valid_session
      expect(response).to be_unauthorized
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new List' do
        expect do
          post :create, params: { list: valid_attributes }, session: valid_session
        end.to change(List, :count).by(1)
      end

      it 'redirects to the created list' do
        post :create, params: { list: valid_attributes }, session: valid_session
        expect(response).to redirect_to(List.last)
      end
    end

    context 'with invalid params', skip: 'no validity checks' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { list: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested list' do
        put :update, params: { id: list.to_param, list: new_attributes }, session: valid_session
        list.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the list' do
        put :update, params: { id: list.to_param, list: valid_attributes }, session: valid_session
        expect(response).to redirect_to(list)
      end

      it "returns unauthorized when trying to access other user's list" do
        put :update, params: { id: other_list.to_param, list: valid_attributes }, session: valid_session
        expect(response).to be_unauthorized
      end
    end

    context 'with invalid params', skip: 'no validity checks' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: list.to_param, list: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested list' do
      list
      expect do
        delete :destroy, params: { id: list.to_param }, session: valid_session
      end.to change(List, :count).by(-1)
    end

    it 'redirects to the lists list' do
      delete :destroy, params: { id: list.to_param }, session: valid_session
      expect(response).to redirect_to(lists_url)
    end

    it "returns unauthorized when trying to access other user's list" do
      delete :destroy, params: { id: other_list.to_param }, session: valid_session
      expect(response).to be_unauthorized
    end
  end
end
