FactoryBot.define do
  factory :item_category do
    sequence(:name) { |n| "TEST_CATEGORY_NAME_#{n}" }
  end
end
