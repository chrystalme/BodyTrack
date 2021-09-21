FactoryBot.define do
  factory :measure do
    title { Faker::Lorem.word }
    unit { Faker::Lorem.word }
    image { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
  end
end
