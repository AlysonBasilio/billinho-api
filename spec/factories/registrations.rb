FactoryBot.define do
  factory :registration do
    value { Faker::Number.decimal(2) }
    invoice_qty { Faker::Number.number(2) }
    expiration_date { Faker::Number.between(1, 31) }
    course { Faker::Lorem.word }
    institution_id { nil }
    student_id { nil }
  end
end
