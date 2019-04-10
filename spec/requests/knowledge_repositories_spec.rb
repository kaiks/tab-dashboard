# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'KnowledgeRepositories', type: :request do
  before(:each) do
    user = create(:user)
    sign_in user
  end

  describe 'GET /knowledge_repositories' do
    it 'works!' do
      get knowledge_repositories_path
      expect(response).to have_http_status(200)
    end
  end
end
