require 'rails_helper'

RSpec.describe Student, type: :model do
  # Association test
  # ensure Student model has a 1:m relationship with the Registration model
  it { should have_many(:registrations).dependent(:destroy) }
  # Validation tests
  # ensure columns name, cpf, birth_date, phone, gender and payment_method.
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cpf) }
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:payment_method) }
  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  it { should validate_uniqueness_of(:cpf).ignoring_case_sensitivity }
  it { should validate_numericality_of(:cpf) }
  it { should define_enum_for(:gender).with(M: 0, F: 1) }
  it { should define_enum_for(:payment_method).with(Boleto: 0, Cartao: 1) }
end
