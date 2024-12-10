FactoryBot.define do
  factory :todo do
    description { Faker::Lorem.paragraph }
    status { :not_completed }
    sequence(:title) { |n| "Title #{n}" }

    trait :invalid do
      # https://umihi.co/blog/20221116-transient-trait-not-registered-referenced-within-definition
      # title nil
      title { nil }
    end
  end
end
