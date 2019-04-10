# frozen_string_literal: true

json.extract! list, :id, :title, :user_id, :position, :created_at, :updated_at
json.url list_url(list, format: :json)
