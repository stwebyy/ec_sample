FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "TEST_ITEM_NAME_#{n}" }
    sequence(:stocks) { |n| "#{n}" }
    sequence(:description) { |n| "TEST_DESCRIPTON_NAME_#{n}" }
    sequence(:hide) { 1 }
  end
end