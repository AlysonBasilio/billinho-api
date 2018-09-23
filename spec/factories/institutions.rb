FactoryBot.define do
  factory :institution do
    name { Faker::University.unique.name }
    cnpj { Faker::Number.unique.number(10) }
    institution_type { Faker::Number.between(0, 2) }
  end
end
