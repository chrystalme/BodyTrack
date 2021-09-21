FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'tester@test.com' }
    password { 'admin112' }
  end
end
