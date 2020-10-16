FactoryBot.define do
  factory :answer do
    question { create(:question) }
    body { "The best answer ever" }
    user { create(:user) }

    trait :wrong do
      body { nil }
    end
  end
end
