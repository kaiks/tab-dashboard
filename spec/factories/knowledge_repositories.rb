# frozen_string_literal: true

FactoryBot.define do
  factory :knowledge_repository do
    name { |n|  "KnowledgeRepository#{n}" }
    url { "https://www.example.com" }
    description { |n| "Knowledge Repository #{n} description" }

    user
  end
end
