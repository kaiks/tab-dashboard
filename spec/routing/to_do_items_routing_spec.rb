# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ToDoItemsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/to_do_items').to route_to('to_do_items#index')
    end

    it 'routes to #new' do
      expect(get: '/to_do_items/new').to route_to('to_do_items#new')
    end

    it 'routes to #show' do
      expect(get: '/to_do_items/1').to route_to('to_do_items#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/to_do_items/1/edit').to route_to('to_do_items#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/to_do_items').to route_to('to_do_items#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/to_do_items/1').to route_to('to_do_items#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/to_do_items/1').to route_to('to_do_items#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/to_do_items/1').to route_to('to_do_items#destroy', id: '1')
    end

    it 'routes to #mark_done via PUT' do
      expect(put: '/to_do_items/1/mark_done').to route_to('to_do_items#mark_done', id: '1')
    end

    it 'routes to #mark_removed via PUT' do
      expect(put: '/to_do_items/1/mark_removed').to route_to('to_do_items#mark_removed', id: '1')
    end
  end
end
