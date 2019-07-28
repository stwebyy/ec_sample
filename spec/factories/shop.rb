FactoryBot.define do
  factory :shop do
    sequence(:name) { |n| "TEST_USER_NAME_#{n}" }
    sequence(:address) { |n| "TEST_email_#{n}@example.com" }
    sequence(:telephone) { |n| "012345678#{n}" }
    sequence(:person) { |n| "TEST_PERSON_#{n}" }
    sequence(:hide) { 1 }
  end
end
