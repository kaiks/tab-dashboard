json.extract! list_item, :id, :url, :read, :read_at, :removed, :created_at, :updated_at
json.url list_item_url(list_item, format: :json)
