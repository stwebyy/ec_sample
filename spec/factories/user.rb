FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TEST_USER_NAME_#{n}" }
    sequence(:email) { |n| "TEST_email_#{n}@example.com" }
    sequence(:password) { |n| "TEST_PASSWORD_#{n}" }
  end
end
