FactoryBot.define do
  factory :rate do
    sequence(:high_rate) { |n| "#{n}" }
    sequence(:low_rate) { |n| "#{n}" }
  end
end
