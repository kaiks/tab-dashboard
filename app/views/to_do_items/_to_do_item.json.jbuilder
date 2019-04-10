# frozen_string_literal: true

json.extract! to_do_item, :id, :user_id, :content, :done, :removed, :done_at, :description, :created_at, :updated_at
json.url to_do_item_url(to_do_item, format: :json)
