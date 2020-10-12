FactoryBot.define do
  factory :answer do
    body { "The best answer ever" }
    user { User.first }

    trait :wrong do
      body { nil }
    end
  end
end
