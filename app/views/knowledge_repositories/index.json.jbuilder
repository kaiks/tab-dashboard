# frozen_string_literal: true

json.array! @knowledge_repositories, partial: 'knowledge_repositories/knowledge_repository', as: :knowledge_repository
