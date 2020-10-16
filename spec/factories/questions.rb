FactoryBot.define do
  factory :question do
    title { "Question title" }
    body { "Question text" }
    user { create(:user) }

    trait :wrong do
      title { nil }
    end
  end
end
