# frozen_string_literal: true

json.array! @to_do_items, partial: 'to_do_items/to_do_item', as: :to_do_item
