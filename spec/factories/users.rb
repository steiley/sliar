FactoryBot.define do
  factory :user do
    sequence(:email){ |n| "default#{n}@sliar.com" }
    password "123456"
    password_confirmation "123456"
  end
end
