FactoryBot.define do
  factory :measurement do
    value { Faker::Number.number(digit: 2) }
    user_id { Faker::Number.number(digit: 10) }
    measure_id { Faker::Number.number(digit: 10) }
  end
end
