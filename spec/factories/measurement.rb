FactoryBot.define do
  factory :measurement do
    value { Faker::Number.number(digit: 2) }
    user_id { Faker::Number.number(digit: 10) }
    date { Faker::Date.in_date_period(month: 6) }
    measure_id { Faker::Number.number(digit: 10) }
  end
end
