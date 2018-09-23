FactoryBot.define do
  factory :registration do
    value { Faker::Number.positive.decimal(2) }
    invoice_qty { Faker::Number.positive.number(2) }
    expiration_date { Faker::Number.within(1..31) }
    course { Faker::Lorem.word }
    institution_id nil
    student_id nil
  end
end
