# frozen_string_literal: true

json.array! @list_items, partial: 'list_items/list_item', as: :list_item
