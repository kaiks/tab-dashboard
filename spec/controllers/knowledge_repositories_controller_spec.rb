require 'rails_helper'

RSpec.describe KnowledgeRepositoriesController, type: :controller do
  login_user
  # This should return the minimal set of attributes required to create a valid
  # KnowledgeRepository. As you add validations to KnowledgeRepository, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:knowledge_repository)
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # KnowledgeRepositoriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      knowledge_repository = KnowledgeRepository.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      knowledge_repository = KnowledgeRepository.create! valid_attributes
      get :show, params: {id: knowledge_repository.to_param}, session: valid_session
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
      knowledge_repository = KnowledgeRepository.create! valid_attributes
      get :edit, params: {id: knowledge_repository.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new KnowledgeRepository" do
        expect {
          post :create, params: {knowledge_repository: valid_attributes}, session: valid_session
        }.to change(KnowledgeRepository, :count).by(1)
      end

      it "redirects to the created knowledge_repository" do
        post :create, params: {knowledge_repository: valid_attributes}, session: valid_session
        expect(response).to redirect_to(KnowledgeRepository.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {knowledge_repository: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested knowledge_repository" do
        knowledge_repository = KnowledgeRepository.create! valid_attributes
        put :update, params: {id: knowledge_repository.to_param, knowledge_repository: new_attributes}, session: valid_session
        knowledge_repository.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the knowledge_repository" do
        knowledge_repository = KnowledgeRepository.create! valid_attributes
        put :update, params: {id: knowledge_repository.to_param, knowledge_repository: valid_attributes}, session: valid_session
        expect(response).to redirect_to(knowledge_repository)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        knowledge_repository = KnowledgeRepository.create! valid_attributes
        put :update, params: {id: knowledge_repository.to_param, knowledge_repository: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested knowledge_repository" do
      knowledge_repository = KnowledgeRepository.create! valid_attributes
      expect {
        delete :destroy, params: {id: knowledge_repository.to_param}, session: valid_session
      }.to change(KnowledgeRepository, :count).by(-1)
    end

    it "redirects to the knowledge_repositories list" do
      knowledge_repository = KnowledgeRepository.create! valid_attributes
      delete :destroy, params: {id: knowledge_repository.to_param}, session: valid_session
      expect(response).to redirect_to(knowledge_repositories_url)
    end
  end

end
