FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    first_name { "Peter" }
    last_name { "Example" }
    email
    password { "1234567890" }
    admin { false }
  end
end
