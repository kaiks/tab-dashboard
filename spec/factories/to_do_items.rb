FactoryBot.define do
  factory :to_do_item do
    content { "MyString" }
    done { false }
    removed { false }
    description { "MyText" }
  end
end
