# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ListsController, type: :routing do
  describe 'routing' do
    it 'root routes to #dashboard' do
      expect(get: '/').to route_to('dashboard#show')
    end
  end
end
