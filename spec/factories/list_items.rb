# frozen_string_literal: true

FactoryBot.define do
  factory :list_item do
    url { 'www.example.com' }
    read { false }
    removed { false }
  end
end
