require 'rails_helper'

RSpec.describe ListItemsController, type: :controller do
  login_user
  # This should return the minimal set of attributes required to create a valid
  # ListItem. As you add validations to ListItem, be sure to
  # adjust the attributes here as well.
  let(:list) { create(:list, user: @user) }

  let(:new_attributes) {
    { description: 'hello world', list_id: list.id }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ListItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      list_item = create(:list_item, list: list)
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      list_item = create(:list_item, list: list)
      get :show, params: {id: list_item.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      list_item = create(:list_item, list: list)
      get :edit, params: {id: list_item.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    let(:valid_attributes) { attributes_for(:list_item).merge(list_id: list.id) }
    context "with valid params" do
      it "creates a new ListItem" do
        expect {
          post :create, params: {list_item: valid_attributes}, session: valid_session
        }.to change(ListItem, :count).by(1)
      end

      it "redirects to the created list_item" do
        post :create, params: {list_item: valid_attributes}, session: valid_session
        expect(response).to redirect_to(ListItem.last)
      end
    end

    context "with invalid params", skip: 'no validity checks yet' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {list_item: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      it "updates the requested list_item" do
        list_item = create(:list_item, list: list)
        put :update, params: {id: list_item.to_param, list_item: new_attributes}, session: valid_session
        list_item.reload
        expect(list_item.description).to eq 'hello world'
      end

      it "redirects to the list_item" do
        list_item = create(:list_item, list: list)
        put :update, params: {id: list_item.to_param, list_item: new_attributes}, session: valid_session
        expect(response).to redirect_to(list_item)
      end
    end

    context "with invalid params", skip: 'no validity checks yet' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        list_item = create(:list_item, list: list)
        put :update, params: {id: list_item.to_param, list_item: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #mark_removed" do
    it 'marks an item as removed' do
      list_item = create(:list_item, list: list, removed: false)
      put :mark_removed, params: { id: list_item.to_param, list_item: new_attributes }, session: valid_session
      expect(response).to redirect_to(list_items_url)
      list_item.reload
      expect(list_item.removed).to eq true
    end
  end

  describe "PUT #mark_read" do
    it 'marks an item as read' do
      list_item = create(:list_item, list: list, read: false)
      put :mark_read, params: { id: list_item.to_param, list_item: new_attributes }, session: valid_session
      expect(response).to redirect_to(list_items_url)
      list_item.reload
      expect(list_item.read).to eq true
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested list_item" do
      list_item = create(:list_item, list: list)
      expect {
        delete :destroy, params: { id: list_item.to_param }, session: valid_session
      }.to change(ListItem, :count).by(-1)
    end

    it "redirects to the list_items list" do
      list_item = create(:list_item, list: list)
      delete :destroy, params: {id: list_item.to_param}, session: valid_session
      expect(response).to redirect_to(list_items_url)
    end
  end
end
