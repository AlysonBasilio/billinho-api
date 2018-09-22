require 'rails_helper'

RSpec.describe Institution, type: :model do
  # Association test
  # ensure Institution model has a 1:m relationship with the Registration model
  it { should have_many(:registrations).dependent(:destroy) }
  # Validation tests
  # ensure columns name, cnpj and type are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cnpj) }
  it { should validate_presence_of(:type) }
end
