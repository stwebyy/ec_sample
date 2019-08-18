FactoryBot.define do
  factory :item_review do
    sequence(:review) { |n| "TEST_REVIEW_#{n}" }
    item_id { 1 }
  end
end
