# frozen_string_literal: true

require 'rails_helper'

RSpec.describe KnowledgeRepositoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/knowledge_repositories').to route_to('knowledge_repositories#index')
    end

    it 'routes to #new' do
      expect(get: '/knowledge_repositories/new').to route_to('knowledge_repositories#new')
    end

    it 'routes to #show' do
      expect(get: '/knowledge_repositories/1').to route_to('knowledge_repositories#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/knowledge_repositories/1/edit').to route_to('knowledge_repositories#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/knowledge_repositories').to route_to('knowledge_repositories#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/knowledge_repositories/1').to route_to('knowledge_repositories#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/knowledge_repositories/1').to route_to('knowledge_repositories#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/knowledge_repositories/1').to route_to('knowledge_repositories#destroy', id: '1')
    end
  end
end
