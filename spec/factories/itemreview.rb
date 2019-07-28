FactoryBot.define do
  factory :itemreview do
    sequence(:review) { |n| "TEST_REVIEW_#{n}" }
  end
end
