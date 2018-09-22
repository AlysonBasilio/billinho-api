require 'rails_helper'

RSpec.describe Student, type: :model do
  # Association test
  # ensure Student model has a 1:m relationship with the Registration model
  it { should have_many(:registration).dependent(:destroy) }
  # Validation tests
  # ensure columns name, cpf, birth_date, phone, gender and payment_method.
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cpf) }
  it { should validate_presence_of(:birth_date) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:payment_method) }
end
