FactoryBot.define do
  factory :invoice do
    value { Faker::Number.decimal(2) }
    expiration_date { Faker::Date.forward(100) }
    status { Faker::Number.between(0, 2) }
    registration
  end
end
