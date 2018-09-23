FactoryBot.define do
  factory :student do
    name { Faker::Name.unique.name }
    cpf { Faker::Number.unique.number(10) }
    birth_date { Faker::Date.birthday(18, 65) }
    phone { Faker::Number.number(10) }
    gender { Faker::Number.between(0, 1) }
    payment_method { Faker::Number.between(0, 1) }
  end
end
