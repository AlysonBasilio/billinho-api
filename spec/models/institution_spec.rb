require 'rails_helper'

RSpec.describe Institution, type: :model do
  # Association test
  # ensure Institution model has a 1:m relationship with the Registration model
  it { should have_many(:registrations).dependent(:destroy) }
  # Validation tests
  # ensure columns name, cnpj and type are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cnpj) }
  it { should validate_presence_of(:institution_type) }
  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  it { should validate_uniqueness_of(:cnpj).ignoring_case_sensitivity }
  it { should validate_numericality_of(:cnpj) }
  it { should define_enum_for(:institution_type).with(Universidade: 0, Escola: 1, Creche: 2) }
end
