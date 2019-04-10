# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "email#{n}@example.com"
    end
    password { 'BlaBlaBla' }
  end
end
