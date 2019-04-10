# frozen_string_literal: true

FactoryBot.define do
  factory :knowledge_repository do
    name { 'MyString' }
    url { 'MyString' }
    description { 'MyText' }
  end
end
