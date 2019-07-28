FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "TEST_CATEGORY_NAME_#{n}" }
  end
end
