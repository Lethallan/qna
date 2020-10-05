FactoryBot.define do
  factory :answer do
    body { "The best answer ever" }

    trait :wrong do
      body { nil }
    end
  end
end
