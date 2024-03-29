FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  sequence :nickname do |n|
    "batman#{n}"
  end

  factory :user do
    nickname
    email
    password { '12345678' }
    password_confirmation { '12345678' }
  end
end
