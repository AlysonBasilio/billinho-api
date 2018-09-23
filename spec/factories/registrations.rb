FactoryBot.define do
  factory :registration do
    value { Faker::Number.decimal(2) }
    invoice_qty { Faker::Number.number(2) }
    expiration_date { Faker::Number.between(1, 31) }
    course { Faker::Lorem.word }
    institution
    student

    after(:create) do |registration|
      create_list(:invoice, registration.invoice_qty, registration: registration)
    end
  end
end
