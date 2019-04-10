# frozen_string_literal: true

json.extract! knowledge_repository, :id, :created_at, :updated_at
json.url knowledge_repository_url(knowledge_repository, format: :json)
