class List < ApplicationRecord
  belongs_to :user
  has_many :list_items
  has_many :pending_items, -> { where(read: false, removed: false) }, class_name: 'ListItem'
end
